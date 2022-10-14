class Public::CustomersController < ApplicationController
  def show
    @customer = Customer.find_by(current_customer)
  end

  def edit
    @customer = Customer.find_by(current_customer)
  end

  def update
    @customer = Customer.find_by(current_customer)
    @customer.update(customer_params)
    redirect_to customers_my_page_path
  end

  def confirm
  end

  def unsubscribe
  end

  private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, :email, :is_deleted)
  end

end
