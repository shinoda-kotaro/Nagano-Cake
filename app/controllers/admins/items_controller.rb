class Admins::ItemsController < Admins::Base
  
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
    @genres = Genre.where(is_effective: true)
  end
  
  def create
    @item = Item.new(params[:id])
  end
  
  def show
    
  end

  def edit
    
  end
  
  def update
    
  end
  
end
