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
   get 'customers/mypage', :to => "customers#show", as: "customers"
   get 'customers/mypage/edit', :to => "customers#edit", as: "edit_customers"
   patch 'customers/mypage', :to => "customers#update"
   get 'customers/mypage/confirm', :to => "customers#confirm"
   patch 'customers/mypage/unsubscribe', :to => "customers#unsubscribe"
   resources :maps, only: [:index]
   resources :post_contents, only: [:index, :show, :new, :create, :update, :destroy, :edit] do
       collection do 
           get :ranking
       end
   resources :comments, only: [:create]
   resource :favorites, only: [:create, :destroy]
   end
 end

  

# 管理者用
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}
end
