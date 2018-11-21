class BlogsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_blog, only:[:show, :edit, :update, :destroy]

  def index
    @blogs = Blog.all
    respond_to do |format|
      format.html
      format.js
    end
  end

  def new
    if params[:back]
      @blog = Blog.new(blogs_params)
    else
      @blog = Blog.new
    end
  end

  def create
    @blog = Blog.new(blogs_params)
    #Blog.create(blogs_params)
    @blog.user_id = current_user.id
    if @blog.save
      redirect_to blogs_path, notice:"ブログを作成しました！"
      NoticeMailer.sendmail_blog(@blog).deliver
    else
      render 'new'
    end
  end

  def edit
    #@blog = Blog.find(params[:id]) 省略
  end

  def update
   # @blog = Blog.find(params[:id]) 省略
    @blog.update(blogs_params)
    if @blog.save
      redirect_to blogs_path, notice:"ブログを編集しました！"
    else
      render 'edit'
    end
  end

  def destroy
    #@blog = Blog.find(params[:id])
    @blog.destroy
    redirect_to blogs_path, notice:"ブログを削除しました！"
  end

  def confirm
    @blog = Blog.new(blogs_params)
    render :new if @blog.invalid?
  end

  def show
    @comment = @blog.comments.build
    @comments = @blog.comments
  end

  private
    def blogs_params
      params.require(:blog).permit(:title, :content)
    end

    def set_blog
      @blog = Blog.find(params[:id])
    end
end
