class BlogsController < ApplicationController
  before_action :authenticate_user!,except:[:index]
  def index
    @blogs = Blog.all
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
