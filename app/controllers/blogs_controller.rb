class BlogsController < ApplicationController
before_action :authenticate_user!, only: [:new, :create] 
  def index
    @blogs = Blog.all
  end

  def new
    @blog = Blog.new
  end

  def show
    @blog = Blog.find(params[:id])
  end

  def create
    blog = Blog.new(blog_params)

    blog.user_id = current_user.id
    
    if blog.save
      redirect_to action: "index"
    else
      redirect_to action: "new"
    end
  end

  def destroy
    @blog = Blog.find(params[:id])
    @blog.destroy
    redirect_to blogs_path, notice:"削除しました"
  end

  def edit
    @blog = Blog.find(params[:id])
  end

  def update
    @blog = Blog.find(params[:id])
    if @blog.update(blog_params)
      redirect_to blogs_path, notice: "編集しました"
    else
      render 'edit'
    end
  end

 def table
  @date = Date.parse(params[:date])
  @blogs = Blog.where(start_time: @date.all_day)
 end
  private

  def blog_params
    params.require(:blog).permit(:title, :user_id, :content, :start_time, :image)
  end

end