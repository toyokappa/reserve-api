class Admin::CustomersController < Admin::ApplicationController
  def index
    @customers = Customer.all
  end
end