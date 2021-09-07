class HomesController < ApplicationController
  def top
    @columns = Column.all
    @patches = Patch.order(created_at: :desc).limit(5)
    @problems = Problem.order(created_at: :desc).limit(5)
    @columns = Column.order(created_at: :desc).limit(5)
    @topics = Topic.order(created_at: :desc).limit(5)
    render layout: 'top_visual'
  end

  def search
    @texts = Text.search(params[:keyword])
    @columns = Column.search(params[:keyword])
    @problems = Problem.search(params[:keyword])
    @patches = Patch.search(params[:keyword])
    @keyword = params[:keyword]
    @mixed = (@texts + @columns + @problems + @patches).sort_by(&:created_at).reverse!
    @mixed_content = Kaminari.paginate_array(@mixed).page(params[:page]).per(4)
  end
end
