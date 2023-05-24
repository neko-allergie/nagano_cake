class Public::DeliAddressesController < ApplicationController
  before_action :authenticate_customer!
  
  def index
   @deli_address = DeliAddress.new
   @deli_addresses = current_customer.deli_addresses
  end

  def edit
    @deli_address = DeliAddress.find(params[:id])
  end

  def create
    # データを受け取り新規登録するためのインスタンス作成
    @deli_address = DeliAddress.new(deli_address_params)
    # 今ログインしている顧客の情報を持ってくる(顧客IDでアソシエーションで引っ張ってくるから)
    @deli_address.customer_id = current_customer.id
    # データをデータベースに保存するためのsaveメソッド実行
    @deli_address.save
    #  リダイレクト
    redirect_to '/public/deli_addresses'
    
  end

  def update
    @deli_address = DeliAddress.find(params[:id])
    if @deli_address.update(deli_address_params)
       redirect_to '/public/deli_addresses'
    else
       render :edit
    end
  end

  def destroy
    deli_address = DeliAddress.find(params[:id])  # データ（レコード）を1件取得
    deli_address.destroy  # データ（レコード）を削除
    redirect_to '/public/deli_addresses'  # 一覧画面へリダイレクト 
  end
  
  private
  # ストロングパラメータ
  def deli_address_params
    params.require(:deli_address).permit(:postcode, :address, :name)
  end
end
