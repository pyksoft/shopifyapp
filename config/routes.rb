Rails.application.routes.draw do  
  root :to => 'home#index'
  mount ShopifyApp::Engine, at: '/'
  resources :options, only: [:update]
  resources :customizations, only: [:update, :edit]
  #resources :options
  #resources :customizations
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/options', to: 'options#show'  
  get 'options/edit', to: 'options#edit'
  
end
