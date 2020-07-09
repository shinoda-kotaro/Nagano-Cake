class Publics::OrdersController < Publics::Base
  def new
    @order = Order.new
    @user = EndUser.find(current_end_user.id)
  end

  def check
    @order = Order.new(order_params)
    @sum = 0
    @user = EndUser.find(current_end_user.id)
    if params[:type] == 'a'
      @order.postcode = @user.postcode
      @order.address = @user.address
      @order.name = (@user.first_name + @user.under_name)
    elsif params[:type] == 'b'
      @user.addresses = Address.find(params[:select_address_id])
      @order.postcode = @user.addresses.postcode
      @order.address = @user.addresses.address
      @order.name = @user.addresses.name
    elsif params[:type] == 'c'
      @order.postcode = params[:new_postcode]
      @order.address = params[:new_address]
      @order.name = params[:new_name]
    end
    if @order.invalid?
      render 'new'
    end
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