Rails.application.routes.draw do

  namespace :public do
    get 'customers/show'
    get 'customers/edit'
  end
  # 顧客用
devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}
 scope module: :public do
   root to: 'homes#top'
   get 'customers/mypage', :to => "customers#show", as: "customers"
   get 'customers/mypage/edit', :to => "customers#edit", as: "edit_customers"
   patch 'customers/mypage', :to => "customers#update"
   get 'customers/mypage/confirm', :to => "customers#confirm"
   patch 'customers/mypage/unsubscribe', :to => "customers#unsubscribe"
 end


# 管理者用
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}
end
