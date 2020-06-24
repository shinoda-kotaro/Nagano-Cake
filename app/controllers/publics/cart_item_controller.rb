class Publics::CartItemController < Publics::Base
  def index
    @cart_items = CartItem.all
  end
  

  def create
    @cart_item = CartItem.new(cart_item_params)
    if @cart_item.save
      flash[:success] = "Object successfully created"
      redirect_to 
    else
      flash[:error] = "Something went wrong"
      render 'index'
    end
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:amount, :item_id, :end_user_id)
  end
end
