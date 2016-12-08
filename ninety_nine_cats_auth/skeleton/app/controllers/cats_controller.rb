class CatsController < ApplicationController
  before_action :not_logged_in_redirect, only: [:edit, :update, :new, :create]

  def index
    @cats = Cat.all
    render :index
  end

  def show
    @cat = Cat.find(params[:id])
    render :show
  end

  def new
    @cat = Cat.new
    render :new
  end

  def create
    @cat = Cat.new(cat_params)
    user_id = current_user.id
    @cat.user_id = user_id

    if @cat.save
      redirect_to cat_url(@cat)
    else
      flash.now[:errors] = @cat.errors.full_messages
      render :new
    end
  end

  def edit
    cats = current_user.cats
    @cat = cats.find(params[:id])

    render :edit
  end

  def update
    cats = current_user.cats
    @cat = cats.find(params[:id])

    if @cat.update_attributes(cat_params)
      redirect_to cat_url(@cat)
    else
      flash.now[:errors] = @cat.errors.full_messages
      render :edit
    end
  end

  private
  def not_logged_in_redirect
    unless current_user
      flash[:messages] ||= []
      flash[:messages] << "Not logged in."
      redirect_to new_user_url
    end
  end

  def cat_params
    params.require(:cat)
      .permit(:age, :birth_date, :color, :description, :name, :sex)
  end
end
