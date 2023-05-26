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
    if @deli_address.save
      # 保存に成功した時
      flash[:notice] = "配送先の登録が完了しました"
      redirect_to '/public/deli_addresses'
    else
      flash[:notice] = "配送先の登録ができませんでした"
      redirect_to '/public/deli_addresses'
    end
  end

  def update
    @deli_address = DeliAddress.find(params[:id])
    if @deli_address.update(deli_address_params)
        flash[:notice] = "配送先の編集が完了しました"
        redirect_to '/public/deli_addresses'
    else
        flash[:notice] = "配送先の編集ができませんでした"
        render :edit
    end
  end

  def destroy
    deli_address = DeliAddress.find(params[:id])  # データ（レコード）を1件取得
    deli_address.destroy # データ（レコード）を削除
    flash[:notice] = "配送先を削除しました"
    redirect_to '/public/deli_addresses'  # 一覧画面へリダイレクト 
  end
  
  private
  # ストロングパラメータ
  def deli_address_params
    params.require(:deli_address).permit(:postcode, :address, :name)
  end
end
