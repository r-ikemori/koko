class Admin::CustomersController < ApplicationController
  before_action :authenticate_admin!
  def index
    @customers = Customer.page(params[:page])

  end

  def show
    @customer = Customer.find(params[:id])
    @post_contents = @customer.post_contents
  end
  
  def unsubscribe
    @customer = Customer.find(params[:id])
    @customer.update(is_active: false)
    redirect_to admin_path
  end

end
