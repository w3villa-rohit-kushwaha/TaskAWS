class BlogsController < ApplicationController
  before_action :require_login, only: [:index, :create]

  def index
    @blogs = Blog.all
    render json: @blogs
  end

  def create
    @blog = current_user.blogs.new(blog_params)

    if @blog.save
      render json: { message: 'Login successful', blog: @blog }, status: :ok
    else
      render json: { error: @blog.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def blog_params
    params.require(:blog).permit(:title, :content)
  end

  def require_login
    unless current_user
      render json: { error: 'Unauthorized' }, status: :unauthorized
    end
  end
end