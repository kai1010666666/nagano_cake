Rails.application.routes.draw do
    root to: "public/homes#top"
  scope module: :public do
    get "about"=>"homes#about"
    resources :items, only: [:index, :show]
devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}
end
  namespace :admin do
    root "homes#top"
    resources :customers, only: [:index, :show, :edit, :update]
    resources :genres, only: [:new, :create, :index, :edit, :update]
    resources :items, only: [:new, :create, :index, :show, :edit, :update]
    get 'orders/show'
    get 'orders_details/update'
  end
devise_for :admins, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
