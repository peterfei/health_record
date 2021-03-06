Rails.application.routes.draw do

  resources :template_infos do
    collection do
      get 'select_message'
      post 'do_select_message'
    end
  end
  resources :health_item_subs
  resources :user_vips
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
  resources :wx_codes do
    collection do
      post 'create_qrcode'
    end
    member do
      get 'download_qrcode'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #主页
  root to: 'welcome#index'
  get 'text'=>'welcome#text'
  # 微信相关
  get 'wx_rist' =>'wechat_api#wx_rist'
  get 'wx_health_data'=>'wechat_api#wx_health_data'
  get 'wx_health_family_data'=>"wechat_api#wx_health_family_data"
  get 'wx_health_family_member'=>"wechat_api#wx_health_family_member"
  post 'get_api_tickets'=>'wechat_api#get_api_tickets'
  #接口
  mount API::Base => "/"
  mount Bbs::Engine=>'/bbs',as:"/bbs"

  namespace :auth do
    resource :sso, controller: 'sso' do
      collection do
        get :login
        get :provider
      end
    end
  end
  # mount Agreements::Engine => "/agreements",:as => 'agreements'
end

