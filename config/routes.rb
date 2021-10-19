Rails.application.routes.draw do
  root to: 'homes#top'
  devise_for :users
  namespace :admin do
   resources :sessions, only:[:new, :create, :destroy] 
   resources :items, only:[:index, :new, :create, :show, :edit, :update]
   resources :genres, only:[:index, :create, :edit, :update]
   resources :customers, only:[:index, :show, :edit, :update]
   resources :orders, only:[:show, :update]
   resources :orders_details, only:[:update]
  end 
end
