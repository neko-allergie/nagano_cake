Rails.application.routes.draw do

# 顧客用
# URL /customers/sign_in ...
  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

# 管理者用
# URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

    root to: "public/homes#top"
    get "homes/about"=>"public/homes#about", as: 'about'
# 顧客用 namespace使うと、全てのpathにpublic/が最初につく
  namespace :public do

    resources :deli_addresses, only:[:index, :edit, :create, :update, :destroy]
    resources :orders, only:[:index, :show, :create, :new, :confirm, :complete]
    resources :customers, only:[:show, :edit, :update, :confirm, :quit]
    resources :cart_items, only: %i[index create destroy] do
     member do
       patch 'increase'
       patch 'decrease'
     end
   end
    resources :items, only:[:index, :show]
  end

  # 管理者用
  namespace :admin do
    root to: "homes#top"
    resources :genres, only:[:index, :create, :edit, :update]
    resources :items, only:[:index, :new, :create, :show, :edit, :update]
    resources :customers, only:[:index, :show, :edit, :update]
  end


  end