class Publics::OrdersController < Publics::Base
  def new
    @user = EndUser.find(current_end_user.id)
    @sum = 0
    @cart_items = @user.cart_items
  end

  def check
    @order = Order.new
    @order.order_details.build
    @cart_items = current_end_user.cart_items.all
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
    @order.payment_status = params[:payment_status]
    @order.total_price = params[:total_price]
    if @order.valid?
      flash[:error] = "Something went wrong"
      render :new
    else
      render :check
    end
  end

  def create
    @order = Order.new(order_params)
    @order.end_user_id = current_end_user.id
    if @order.save
      flash[:success] = "Object successfully created"
      cart_items = current_end_user.cart_items
      cart_items.each do |cart_item|
        unless cart_item.destroy
          flash[:error] = 'Something went wrong'
          redirect_to mypage_path
        end
      end
      redirect_to done_order_path
    else
      flash[:error] = "Something went wrong"
      @user = EndUser.find(current_end_user.id)
      @sum = 0
      @cart_items = @user.cart_items
      render 'new'
    end
  end

  def done
  end

  def index
    @user = EndUser.find(current_end_user.id)
    @orders = @user.orders.all
  end
  
  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details.all
  end
  
  private

  def order_params
    params.require(:order).permit(:end_user_id, :postcode, :address, :name, :postage, :payment_status, :order_status, :total_price, order_details_attributes: [:price, :item_id, :order_id, :amount])
  end
  
end