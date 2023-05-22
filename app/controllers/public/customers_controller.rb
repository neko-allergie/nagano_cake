class Public::CustomersController < ApplicationController
   before_action :authenticate_customer!
   
    def show
      @customer = current_customer
    end
    
    def edit
      @customer = current_customer
    end
    
    def update
      customer = current_customer
      customer.update(customer_params)
      redirect_to public_customer_edit_path
    end
    
    def confirm
    end
    
    def quit
      current_customer.update
      reset_session
      redirect_to root_path, notice: 'Successfully withdraw from Ecommerce'
    end
    
    private
    def customer_params
      params.require(:customer).permit(:last_name, :last_kana, :postcode, :address, :phone_number, :email)
    end
end