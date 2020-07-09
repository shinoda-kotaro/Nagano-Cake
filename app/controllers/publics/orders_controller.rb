class Publics::OrdersController < Publics::Base
  def new
    @order = Order.new
  end

  def check

  end

  def create
    @order = Order.new(order_params)
    @order.end_user_id = current_end_user.id
    if @order.save
      flash[:success] = "Object successfully created"
      redirect_to orders_path
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end
  

  private

  def order_params
    params.require(:order).permit(:postcode, :address, :name)
  end
  
end