class Publics::OrdersController < Publics::Base
  def new
    @user = EndUser.find(current_end_user.id)
  end

  def check
    @order = Order.new
    @cart_items = current_end_user.cart_items
    @order.order_details.build
    @sum = 0
    @user = EndUser.find(current_end_user.id)
    if params[:type] == 'a'
      @order.postcode = @user.postcode
      @order.address = @user.address
      @order.name = @user.first_name + @user.under_name
    elsif params[:type] == 'b'
      @address = @user.addresses.find(params[:select_address_id])
      @order.postcode = @address.postcode
      @order.address = @address.address
      @order.name = @address.name
    elsif params[:type] == 'c'
      @order.postcode = params[:new_postcode]
      @order.address = params[:new_address]
      @order.name = params[:new_name]
    end
    if @order.valid?
      render action: :check
    else
      render action: :new
    end
  end

  def create
    @order = Order.new(order_params)
    if @order.save
      flash[:success] = "Object successfully created"
      redirect_to root_path
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end

  private

  def order_params
    params.require(:order).permit(:postcode, :address, :name, :postage, :payment_status, :order_status, :total_price, order_detail_attributes: [:price, :production_status, :amount])
  end
  
end