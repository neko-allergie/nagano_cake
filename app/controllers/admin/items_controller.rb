class Admin::ItemsController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_item, only: %i[show edit update]

  def index
    @items = Item.page(params[:page]).per(10)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to admin_items_path, notice: "商品の新規登録が完了しました。"
    else
      render :new
    end
  end

  def show
    #set_itemで定義済み
  end

  def edit
    #set_itemで定義済み
  end

  def update
    #set_itemで定義済み
    if @item.update(item_params)
      redirect_to admin_items_path, notice: "商品内容の変更が完了しました。"
    else
      render :edit
    end
  end

  private

　def set_item
　  @item = Item.find(params[:id])
　end

  def item_params
    params.require(:item).permit(:genre_id, :name, :introduction, :without_tax, :sale_status, :image)

  end
end