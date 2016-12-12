class GoalsController < ApplicationController
  before_action :ensure_logged_in

  def new

  end

  def create
    @goal = Goal.new(goal_params)
    @goal.user_id = current_user.id

    if @goal.save
      redirect_to goal_url(@goal)
    else
      flash.now[:errors] = @goal.errors.full_messages
      render :new
    end
  end

  def index
    @goals = Goal.all
  end

  def show
    @goal = Goal.find(params[:id])
  end

  def edit
    @goal = Goal.find(params[:id])
  end

  def update
    @goal = Goal.find(params[:id])

    if @goal.update(goal_params)
      redirect_to goal_url(@goal)
    else
      flash.now[:errors] = @goal.errors.full_messages
      render :edit
    end
  end

  def destroy
    @goal = Goal.find(params[:id])
    user = @goal.user
    @goal.destroy
    redirect_to user_url(user)
  end

  private

  def goal_params
    params.require(:goal).permit(:body, :privacy, :complete)
  end
end
