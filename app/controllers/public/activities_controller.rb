class Public::ActivitiesController < ApplicationController
  def index
    @activities = current_user.activities.order(created_at: :desc)
    @user = current_user
  end
end
