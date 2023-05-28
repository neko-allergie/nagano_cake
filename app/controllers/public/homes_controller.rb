class Public::HomesController < ApplicationController
    def top
        @genres = Genre.all
        @items = Item.page(params[:page]).limit(3)
    end

    def about
    end
    
    
      private
  
    def item_params
      params.require(:item).permit(:name,:image,:introduction)
    end
end
