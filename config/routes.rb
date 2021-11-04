Rails.application.routes.draw do

  root to: 'public/homes#top'

  devise_for :customers, controllers: {
    sessions: 'customers/sessions',
    passwords: 'customers/passwords',
    registrations: 'public/registrations'
  }
  devise_for :admins, controllers: {
    sessions: 'admin/sessions',
    passwords: 'admin/passwords',
    registrations: 'admin/registrations'
  }

  scope module: :public do
    resources :items, only:[:index, :show]
    resources :registrations, only:[:new, :create]
    resources :sessions, only:[:new, :create, :destroy]
    resources :customers, only:[:show, :edit, :update]
    get 'unsubsceibe' => 'customers#unsubsceibe'
    patch 'withdraw' => 'customers#withdraw'
    resources :cart_items, only:[:index, :update, :destroy, :create]
    delete 'all_destroy' => 'cart_items#all_destroy'
    resources :orders, only:[:new, :create, :index, :show]
    post 'log' => 'orders#log'
    get 'thanks' => 'orders#thanks'
    resources :addresses, only:[:index, :edit, :create, :update, :destroy]
  end

  namespace :admin do
    resources :sessions, only:[:new, :create, :destroy]
    resources :items, only:[:index, :new, :create, :show, :edit, :update]
    resources :genres, only:[:index, :create, :edit, :update]
    resources :customers, only:[:index, :show, :edit, :update]
    resources :orders, only:[:show, :update]
    resources :orders_details, only:[:update]
  end
end
