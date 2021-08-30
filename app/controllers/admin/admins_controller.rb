class Admin::AdminsController < ApplicationController

  def show
    @admin = Admin.find(params[:id])
    @texts = @admin.texts.order(created_at: :desc).limit(5)
    @problems = @admin.problems.order(created_at: :desc).limit(5)
  end
end
