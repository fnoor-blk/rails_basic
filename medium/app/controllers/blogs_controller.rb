class BlogsController < ApplicationController
  before_action :authenticate_user!,except:[:index]
  before_action :set_blog,only:[:edit,:update,:destroy]
  def index
    @blogs = Blog.order(:created_at).page(params[:page]).per(10) if user_signed_in?
    @blogs = Blog.order(:created_at).first(10) unless user_signed_in?
  end

  def my_blogs
    @blog = Blog.new
    @blogs = Blog.order(:created_at,:asc).where(author:current_user).page(params[:page]).per(10)
  end

  def show
  end

  def new
  end

  def create
    @blog = Blog.new
    @blog.title = params[:blog][:title]
    @blog.description = params[:blog][:description]
    @blog.author = current_user
    if @blog.save
      redirect_to my_blogs_path
    else
      render text:"Failed To Save"
    end
  end

  def update
    @blog.title = params[:blog][:title]
    @blog.description = params[:blog][:description]
    if @blog.save
      redirect_to my_blogs_path
    else
      render text:"Failed To Edit"
    end
  end

  def edit 
    if @blog.author != current_user
      redirect_to root_path
    end
  end

  def delete
  end

  def destroy
    @blog.destroy
    redirect_to my_blogs_path
  end

  private

  def set_blog
    @blog = Blog.find params[:id]
  end
end
