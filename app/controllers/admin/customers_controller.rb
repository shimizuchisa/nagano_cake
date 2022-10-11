class Admin::CustomersController < ApplicationController
  def show
    @customer = Customer.find(@customers.id)
  end

  def index
    @customers = Customer.all
  end

  def edit
    @customer = Customer.find(@customers.id)
  end

  def update
   @customer = Customer.find(@customers.id)
  end
end
