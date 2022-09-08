class Public::CustomersController < ApplicationController
  def show
    @customer =  Customer.find(params[:id])
    @post_contents = @customer.post_contents
  end

end
