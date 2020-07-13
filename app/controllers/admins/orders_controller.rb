class Admins::OrdersController < Admins::Base
  def index
    @orders = Order.all
    @sum = 0
  end
  
  def show
    @order = Order.find(params[:id])
  end
  
  def update
    @order = Object.find(params[:id])
      if @order.update(order_params)
        flash[:success] = "Object was successfully updated"
        redirect_to @order
      else
        flash[:error] = "Something went wrong"
        render 'edit'
      end
  end

  private

  def order_params
    params.require(:order).permit()
  end
  
end
