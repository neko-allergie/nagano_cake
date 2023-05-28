class Public::HomesController < ApplicationController
    def top
        @genres = Genre.all
        @q = Item.ransack(params[:q])
    end

    def about
    end
end
