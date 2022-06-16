Rails.application.routes.draw do
  resources :temp_data
  resources :temp_devices
  get 'temp_device/dashboard', to: 'temp_devices#dashboard' , as:'dashboard_temp'
  get 'temp_device/update_grafico', to: 'temp_devices#update_grafico' , as:'update_grafico'
  
  resources :weight_devices
  get 'weight_device', to: 'weight_devices#dashboard', as: 'dashboard_weight'
  resources :weight_data
  resources :outlets
  devise_for :users
  get 'screens/show/',to: 'screens#configInit'
  get 'screens/show/:id',to: 'screens#show'
  get 'screens/update',to:'screens#update'
  get 'screens/index', to:'screens#index'
  get  'screens/modal/:id', to:'screens#open_modal',as:'open_modal'
  get  'screens/modalb/:id', to:'screens#open_modal_back',as:'open_modalb'
  post 'screens/modal/update',to:'screens#open_modal_update',as:'open_modal_update'
  post 'screens/modal/update',to:'screens#open_modalback_update',as:'open_modalback_update'
  get 'admin/index'
  root 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
