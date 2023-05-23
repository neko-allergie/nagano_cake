class Admin::ItemsController < ApplicationController
  before_action :authenticate_admin!

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
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to admin_items_path, notice: "商品内容の変更が完了しました。"
    else
      render :edit
    end
  end

  private

  def item_params
  params.require(:item).permit(:genre_id, :name, :introduction, :without_tax, :sale_status, :image)

  end
end