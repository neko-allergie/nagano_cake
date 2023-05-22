class Admin::CustomersController < ApplicationController
  def index
    @customers = Customer.page(params[:page])
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
  @customer = Customer.find(params[:id])
  if @customer.update(customer_params)
    redirect_to admin_customer_path(@customer), notice: 'Successfully updated customer status'
  else
    render "edit"
  end
  end



  private
  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_kana, :first_kana, :postcode, :address, :phone_number, :email)
  end


end
