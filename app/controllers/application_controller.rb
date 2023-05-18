class ApplicationController < ActionController::Base

  private
  # ログイン後のリダイレクト先
  def after_sign_in_path_for(resource_or_scope)
      if resource_or_scope.is_a?(Admin)
        admin_orders_path
      else
        customers_path
      end
  end

  # ログアウト後のリダイレクト先
  def after_sign_out_path_for(resource_or_scope)
      if  resource_or_scope == :admin
        new_admin_session_path
      else
        root_path
      end
  end

  def current_cart
    # セッションから取得したcart_idを元にCartテーブルからCart情報を取得
    current_cart = Cart.find_by(id: session[:cart_id])
    # Cart情報が存在しない場合、@current_cartを作成
    current_cart = Cart.create unless current_cart
    # 取得したCart情報よりIDを取得し、セッションに設定
    session[:cart_id] = current_cart.id
    # Cart情報を返却
    current_cart
  end



end
