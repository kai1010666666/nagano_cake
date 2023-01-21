Rails.application.routes.draw do
  root to: "homes#top"
  get "about"=>"homes#about"
  get "items"=>"items#index"
  get "item"=>"items#show"
devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}
  namespace :admin do
    root "homes#top"
    get 'items/new'
    get 'items/index'
    get 'items/show'
    get 'items/edit'
  end
devise_for :admins, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
