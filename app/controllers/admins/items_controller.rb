class Admins::ItemsController < Admins::Base
  
  def index
    @items = Item.all
    if params[:search]
      @search_items = Item.search(params[:search])
    end
  end

  def new
    @item = Item.new
    @genres = Genre.where(is_effective: true)
  end
  
  def create
    @item = Item.new(item_params)
    if @item.save
      flash[:success] = "Object successfully created"
      redirect_to admins_item_path(@item.id)
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end
  
  
  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
    @genres = Genre.where(is_effective: true)
  end
  
  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to admins_items_path
    else
      render 'edit'
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :genre_id, :price, :is_sale, :image, :description)
  end
  
end
