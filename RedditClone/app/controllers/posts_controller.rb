class PostsController < ApplicationController
  before_filter :require_signed_in

  def show
    @post = Post.find(params[:id])
    render :show
  end

  def new
    @post = Post.new
    @subs = Sub.all
    render :new
  end

  def create
    @post = Post.new(post_params)
    @post.author_id = current_user.id

    if @post.save
      @post.url = "#{post_url(@post)}"
      redirect_to post_url(@post)
    else
      flash[:errors]= @post.errors.full_messages
      redirect_to new_post_url
    end
  end

  def edit
    @post = Post.find(params[:id])
    @subs = Sub.all
    render :edit
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to post_url(@post)
    else
      flash[:errors]= @post.errors.full_messages
      redirect_to edit_post_url(@post)
    end

  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to subs_url
  end

  private

  def post_params
    params.require(:post).permit(:title, :url, :content, sub_ids: [])
  end

  def create_post_subs(post)
    post_params[:sub_ids].each do |sub_id|
      PostSub.create!(post: post, sub_id: sub_id)
    end
  end

end
