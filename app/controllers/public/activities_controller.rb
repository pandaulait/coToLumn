class Public::ActivitiesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @activities = @user.activities.order(created_at: :desc)
  end
end
