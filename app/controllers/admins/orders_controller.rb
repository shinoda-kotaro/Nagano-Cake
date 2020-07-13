class Admins::OrdersController < Admins::Base
  def index
    @orders = Order.all
    @sum = 0
  end
  
  def show
    @order = Order.find(params[:id])
  end
  
  #def update
  #  @order = Order.find(params[:id])
  #  if params[:order].present?
  #    if @order.update(order_params)
  #      if Order.order_statuses[@order.order_status] == 1
  #        @order_detail = @order.order_details.all
  #        @order_detail.each do |v|
  #          v.production_status = 1
  #        end
  #        @order_detail.update(order_detail_params)
  #      end
  #      flash[:success] = "Object was successfully updated"
  #      redirect_to admins_order_path(@order.id)
  #    else
  #      flash[:error] = "Something went wrong"
  #      render 'show'
  #    end
  #  elsif params[:order_detail].present?
  #    @order_detail = @order.order_details.find_by(item_id: params[:order_detail][:item_number])
  #    if @order_detail.update(order_detail_params)
  #      if OrderDetail.production_statuses[@order_detail.production_status] == 2 && Order.order_statuses[@order.order_status] < 2
  #        @order.order_status = 'in_production'
  #        @order.update(order_params)
  #      end
  #      @order_detail = @order.order_details
  #      if OrderDetail.production_statuses[@order_detail.production_status].all? {|v| v == 3}
  #        @order.order_status = 'preparing_for_shipping'
  #        @order.update(order_params)
  #      end
  #      flash[:success] = "Object was successfully updated"
  #      redirect_to admins_order_path(@order.id)
  #    else
  #      flash[:error] = "Something went wrong"
  #      render 'show'
  #    end
  #  end
  #end

  def update
    @order = Order.find(params[:id])
    if @order.update(order_params)
      if Order.order_statuses[@order.order_status] == 1 && !(@order.order_details.where.not(production_status: 'cannot_start').present?)
        @order.order_details.each do |a|
          a.production_status = 'awaiting_production'
        end
        @order.update(order_params)
      elsif @order.order_details.find_by(production_status: 'in_production').present? && Order.order_statuses[@order.order_status] < 2
        @order.order_status = 'in_production'
        @order.update(order_params)
      elsif !(@order.order_details.where.not(production_status: 'cannot_start').present?)
        @order.order_status = 'preparing_for_shipping'
        @order.update(order_params)
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
end
