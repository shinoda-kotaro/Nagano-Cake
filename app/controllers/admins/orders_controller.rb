class Admins::OrdersController < Admins::Base
  def index
    @orders = Order.all
    @sum = 0
  end
  
  def show
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
    if @order.update(order_params)
      if Order.order_statuses[@order.order_status] == 1 && !(@order.order_details.where.not(production_status: 'cannot_start').present?)
          @order.order_details.each do |a|
            a.update(production_status: 'awaiting_production')
          end
      elsif @order.order_details.find_by(production_status: 'in_production').present? && Order.order_statuses[@order.order_status] < 2
          @order.update(order_status: 'in_production')
      elsif !(@order.order_details.where.not(production_status: 'production_completed').present?)
          @order.update(order_status: 'preparing_for_shipping')
      end
      redirect_to admins_order_path(@order.id)
    else
      flash[:error] = "Something went wrong"
      render 'show'
    end
  end

  private

  def order_params
    params.require(:order).permit(:order_status , order_details_attributes: [:production_status , :id])
  end

  def order_params2
    params.require(:order).permit(:order_status)
  end
end
