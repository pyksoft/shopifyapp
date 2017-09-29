Rails.application.routes.draw do  
  root :to => 'home#index'
  get '/custom', :to => 'home#custom'
  mount ShopifyApp::Engine, at: '/'
  resources :options, only: [:update, :edit]
  #resources :customizations, only: [:update, :edit]
  #resources :options
  resources :customizations
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/options', to: 'options#show'  
end
