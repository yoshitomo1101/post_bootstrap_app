class PostsController < ApplicationController
  before_action :set_post, only: %i[show edit update destroy]

  def index
    @posts = Post.order(id: :asc)
  end

  def show
    # 修正
    # @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    post = Post.create!(post_params)
    redirect_to post, notice: "投稿しました"
    # 上記と同じ意味
    # flash[:notice] = "投稿しました"
    # redirect_to post
  end

  def edit
    # 修正
    # @post = Post.find(params[:id])
  end

  def update
    # 修正（@を追加しているので注意！）
    # post = Post.find(params[:id])
    @post.update!(post_params)
    redirect_to @post, notice: "更新しました"
  end

  def destroy
    # 修正（@を追加しているので注意！）
    # post = Post.find(params[:id])
    @post.destroy!
    redirect_to root_path, alert: "削除しました"
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content)
  end
end
