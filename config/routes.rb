Rails.application.routes.draw do

  root to: 'public/homes#top'
  get 'about' => 'public/homes#about'

  scope module: :public do
    get 'customers/my_page', to: 'customers#show'
    get 'customers/my_page/edit', to: 'customers#edit'
    patch 'customers/my_page', to: 'customers#update'
    get 'customers/confirm', to: 'customers#confirm'
    patch 'customers/unsubscribe', to: 'customers#unsubscribe'
    delete 'cart_items/destroy_all', to: 'cart_items#destroy_all'
    post 'orders/confirm', to: 'orders#confirm'
    get 'orders/complete', to: 'orders#complete'
    resources :items, only:[:index, :show]
    resources :cart_items, only:[:index, :create, :update, :destroy]
    resources :orders, only:[:new, :create, :index, :show]
    resources :addresses, only:[:index, :create, :edit, :update, :destroy]
  end

  namespace :admin do
    get '/' => 'homes#top'
    resources :genres, only:[:index, :create, :edit, :update]
    resources :items, only:[:index, :new, :create, :show, :edit, :update]
    resources :customers, only:[:index, :show, :edit, :update]
    resources :order_items, only:[:update]
    resources :orders, only:[:update, :edit]
  end


# devise顧客用
# URL /customers/sign_in ...
devise_for :customers, skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

# devise管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords], controllers: {
  sessions: "admin/sessions"
}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end