class StaticPagesController < ApplicationController
  def home
  	@posts = Post.paginate(page: params[:page], per_page: 12)
  end
end
