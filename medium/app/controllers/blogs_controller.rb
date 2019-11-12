class BlogsController < ApplicationController
  before_action :authenticate_user!,except:[:index]
  def index
    @blogs = Blog.order(:created_at).page(params[:page]).per(10) if user_signed_in?
    @blogs = Blog.order(:created_at).first(10) unless user_signed_in?
  end

  def my_blogs
  end

  def show
  end

  def new
  end

  def create
  end

  def update
  end

  def edit
  end

  def delete
  end

  def destroy
  end
end
