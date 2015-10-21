class CommendsController < ApplicationController
  def create
    # binding.pry
    @post = Post.find(params[:post_id])
    @review = @post.commends.create(user_id: current_user.id, review: review_params[:review] )
    respond_to do |format|
      format.html 
      format.js
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @review = commend.find(parmas[:id])
    respond_to do |format|
      format.html
      format.js 
    end
    @review.destroy
  end

  private

  def review_params
    params.require(:commend).permit(:user_id, :review)
  end
end
