class HomesController < ApplicationController
  def top
    @columns = Column.all
    @patches = Patch.order(created_at: :desc).limit(5)
    @problems = Problem.order(created_at: :desc).limit(5)
    @columns = Column.order(created_at: :desc).limit(5)
    @topics = Topic.order(created_at: :desc).limit(5)
    render :layout => 'top_visual'
  end


end
