Rails.application.routes.draw do
  resource :wechat, only: [:show, :create]
  devise_for :accounts, controllers: { sessions: 'accounts/sessions', registrations:'accounts/registrations', passwords:'accounts/passwords' }
  resources :accounts do
    collection do
      get 'edit_password'
      patch 'update_password'
      post 'create_account'
      delete 'destroy_account'
      get 'update_account'
      patch 'edit_account'
    end
  end
  resources :take_medicine_attentions
  resources :take_medicine_managements
  resources :medical_record_managements
  resources :health_item_attentions
  resources :health_item_records do
    collection do
      post 'get_health_items'
    end
  end
  resources :health_items
  resources :users do
    collection do
      post 'check_medical_records'
      post 'check_item_records'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #主页
  root to: 'welcome#index'
  get 'welcome/text'=>'welcome#text'
  #接口
  mount API::Base => "/"
end

