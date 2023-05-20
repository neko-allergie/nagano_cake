class Public::CustomersController < ApplicationController
  def show
    @customer == Customer.find(params[:id])
  end

  def edit
  end

  def update
  end

  def confirm
  end

  def quit
  end
end