Rails.application.routes.draw do

# 顧客用
# URL /customers/sign_in ...
  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

# 管理者用
# URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords], git controllers: {
    sessions: "admin/sessions"
  }

# 顧客用
  namespace :public do
    root to: "homes#top"
    get "/home/about"=>"homes#about", as: 'about'
    resources :deli_addresses, only:[:index, :edit, :create, :update, :destroy]
    resources :orders, only:[:index, :show, :create, :new, :confirm, :complete]
    resources :cart_item, only:[:index, :create, :destroy, :destroy_all, :update]
    resources :items, only:[:index, :show]
  end

  # 管理者用
  namespace :admin do
    get 'homes/top'
    resources :genres, only:[:index, :create, :edit, :update]
    resources :items, only:[:index, :new, :create, :show, :edit, :update]
    resources :customers, only:[:index, :show, :edit, :update]
  end
end
