class Admin::HomesController < ApplicationController
  def top
    @orders = Order.page(params[:page])
    @orders = @orders.where(customer_id: params[:customer_id].to_i) if params[:customer_id].present?
    @customer = Customer.find_by(id: params[:customer_id])
    # where()内のparams[:]の中は@いらない
  end

end
