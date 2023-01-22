Rails.application.routes.draw do
  namespace :admin do
    get 'orders_details/update'
  end
  namespace :admin do
    get 'customers/index'
    get 'customers/show'
    get 'customers/edit'
    get 'customers/update'
  end
  namespace :admin do
    get 'orders/show'
  end
  root to: "homes#top"
  get "about"=>"homes#about"
  get "items"=>"items#index"
  get "item"=>"items#show"
  namespace :public do
devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}
end
  namespace :admin do
    root "homes#top"
    resources :genres, only: [:new, :create, :index, :edit, :update]
    resources :items, only: [:new, :create, :index, :show, :edit, :update]
  end
devise_for :admins, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
