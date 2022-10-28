class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!, except: [:top]
  def show
    @customer = Customer.find(params[:id])
    @post_contents = @customer.post_contents
  end
end
