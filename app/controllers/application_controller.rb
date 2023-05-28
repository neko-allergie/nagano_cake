class ApplicationController < ActionController::Base
    before_action :search

  def search
    @q = Item.ransack(params[:q])
    @item = @q.result(distinct: true)
    @result = params[:q]&.values&.reject(&:blank?)
  end
end
