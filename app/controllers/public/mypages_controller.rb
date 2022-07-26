class Public::MypagesController < ApplicationController
  before_action :authenticate_customer!, except: [:top]
  before_action :check_guest_customer

  def edit
    @customer = current_customer
  end

  def update
    customer = current_customer
    customer.update(customer_params)
    redirect_to customer_path(current_customer)
  end

  def confirm
  end

  def unsubscribe
    @customer = current_customer
    @customer.update(is_active: false)
    reset_session
    redirect_to root_path
  end

  private

  def customer_params
    params.require(:customer).permit(:name, :introduction, :email, :profile_image)
  end

  def check_guest_customer
    redirect_to root_path if current_customer.email == 'guest@example.com'
  end
end
