class Admin::ActivitiesController < ApplicationController
  def index
    @admin = Admin.find(1)
    @activities = @admin.activities.order(created_at: :desc)
  end
end
