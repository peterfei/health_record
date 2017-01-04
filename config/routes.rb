Rails.application.routes.draw do
  resource :wechat, only: [:show, :create]
  devise_for :accounts, controllers: { sessions: 'accounts/sessions', registrations:'accounts/registrations', passwords:'accounts/passwords' }
  resources :accounts do
    collection do
      get 'edit_password'
      patch 'update_password'
    end
  end
  resources :take_medicine_attentions
  resources :take_medicine_managements
  resources :medical_record_managements
  resources :health_item_attentions
  resources :health_item_records
  resources :health_items
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #主页
  root to: 'welcome#index'

  #接口
  mount API::Base => "/"
end

