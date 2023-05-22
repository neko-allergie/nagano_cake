class Public::ItemsController < ApplicationController
  # before_action :authenticate_customer!, except: [:index ,:show]index ,:showしかないのでいらない
  def index
    @genres = Genre.all
    if params[:genre_id].present?
      #presentメソッドでparams[:genre_id]に値が含まれているか確認 => trueの場合下記を実行
      puts 'test'
      @genre = Genre.find(params[:genre_id])
      @items = @genre.items.page(params[:page])
    else
      @items = Item.page(params[:page])
    end
  end

  def show
    @item = Item.find(parms[:id])
  end

  private

end