Rails.application.routes.draw do
    root to: "public/homes#top"
  devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}
devise_for :admins, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}
  scope module: :public do
    get "about"=>"homes#about"
    resources :items, only: [:index, :show]
    resources :customers, only: [:show, :edit, :uppdate]
    get "customers/confrim_withdraw"
    get "customers/withdraw"
    resources :cart_items, only: [:index, :update, :destroy, :destroy_all, :create]
    resources :orders, only: [:new, :confrim, :completion, :create, :index, :show]
    resources :addresses, only: [:index, :edit, :create, :update, :destroy]
end
  namespace :admin do
    root "homes#top"
    resources :customers, only: [:index, :show, :edit, :update]
    resources :genres, only: [:new, :create, :index, :edit, :update]
    resources :items, only: [:new, :create, :index, :show, :edit, :update]
    get 'orders/show'
    get 'orders_details/update'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
