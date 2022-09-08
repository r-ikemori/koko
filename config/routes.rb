Rails.application.routes.draw do

  # 顧客用
devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

 devise_scope :customer do
   post 'customers/guest_sign_in', to: 'public/sessions#guest_sign_in'
 end

 scope module: :public do
  root to: 'homes#top'
  resources :customers, only: [:show]
  resource :mypage, only: [:edit, :update] do
      collection do
          get :confirm
          patch :unsubscribe
      end
  end
  resources :favorites, only: [:index]
  resources :maps, only: [:index]
  resources :post_contents, only: [:index, :show, :new, :create, :update, :destroy, :edit] do
       collection do 
           get :ranking
       end
     resources :comments, only: [:create, :destroy]
     resource :favorite, only: [:create, :destroy]
   end
 end

  

# 管理者用
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

namespace :admin do
    get '/', :to => "homes#top"
    resources :post_contents, only: [:show, :destroy] do
       collection do 
           get :ranking
       end
    end
    # resources :items, only: [:create, :edit, :index, :update, :new, :show]
    # resources :customers, only: [:edit, :index, :update, :show]
    # resources :orders, only: [:show, :update]
    patch 'ordered_products/:id', :to => "ordered_products#update", as: "update_ordereb"
  end
end
