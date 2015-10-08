class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all.sort_by{|likes| likes.thumbs_up_total}
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @post = Post.find(params[:id])
    @users = @post.likes.all
    like_checking = Like.find_by(user: current_user, post: @post)
    if like_checking
      if like_checking.like == true 
        @like_post = 1
      else
        @like_post = -1
      end
    else
      @like_post = 0
    end
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create  
    @post = current_user.posts.build(post_params)
    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def like
    if logged_in?  
      @post = Post.find(params[:id])
      my_like = Like.find_by(user: current_user, post: @post)
      if !my_like
        Like.create(like: params[:like], user: current_user, post: @post).save
        flash[:success] = "success" 
        redirect_to :back
      else
        if my_like[:like].to_s == params[:like]
          flash[:danger] = "You can only like or dislike once"
          redirect_to :back
        else
          my_like.toggle!(:like)
          flash[:success] = "change"
          redirect_to :back
        end
      end
    else
      redirect_to :back
    end
  end  

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = Post.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def post_params
    # params[:user_id] = current_user.id
    params.require(:post).permit( :location, :type_post, :title, :area, :price, :address, :desc, :picture, :user_id )
  end
end

