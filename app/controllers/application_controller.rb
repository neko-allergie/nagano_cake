class ApplicationController < ActionController::Base


  # ログイン後のリダイレクト先
  def after_sign_in_path_for(resource_or_scope)
      if resource_or_scope.is_a?(Admin)
        admin_root_path
      else
        public_root_path
      end
  end

  # ログアウト後のリダイレクト先
  def after_sign_out_path_for(resource_or_scope)
      if  resource_or_scope == :admin
        new_admin_session_path
      else
        public_root_path
      end
  end





end
