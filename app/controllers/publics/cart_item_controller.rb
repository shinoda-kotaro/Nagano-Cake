class Publics::CartItemController < Publics::Base
  def index
    @cart_items = current_end_user.cart_items
  end
  

  def create
    @cart_item = CartItem.find_or_initialize_by(item_id: params[:cart_item][:item_id], end_user_id: current_end_user.id)
    if !@cart_item.new_record?
      @cart_item.update_attributes({amount: @cart_item.amount + (params[:cart_item][:amount]).to_i })
      redirect_to cart_items_path
    else
      @cart_item = CartItem.new(cart_item_params)
      @cart_item.end_user_id = current_end_user.id
      if @cart_item.save
        flash[:success] = "Object successfully created"
        redirect_to cart_items_path
      else
        flash[:error] = "Something went wrong"
        render 'index'
      end
    end
  end

  def update
    @cart_item = CartItem.find(params[:id])
    if @cart_item.update(cart_item_params)
      flash[:success] = "Object was successfully updated"
      redirect_to cart_items_path
    else
      flash[:error] = "Something went wrong"
      render 'index'
    end
  end
  
  def destroy
    cart_item = CartItem.find(params[:id])
    if cart_item.destroy
      flash[:success] = 'Object was successfully deleted.'
      redirect_to cart_items_path
    else
      flash[:error] = 'Something went wrong'
      redirect_to cart_items_path
    end
  end

  def all_destroy
    cart_items = current_end_user.cart_items
    cart_items.each do |cart_item|
      unless cart_item.destroy
        flash[:error] = 'Something went wrong'
        redirect_to cart_items_path
      end
    end
    flash[:success] = 'Object was successfully deleted.'
    redirect_to cart_items_path
  end
  
  private

  def cart_item_params
    params.require(:cart_item).permit(:amount, :item_id, :end_user_id)
  end
end
