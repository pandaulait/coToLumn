class Admin::ActivitiesController < ApplicationController
  before_action :authenticate_admin!
  def index
    @admin = Admin.find(1)
    @activities = @admin.activities.order(created_at: :desc)
  end
end
