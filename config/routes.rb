Rails.application.routes.draw do  
  root :to => 'home#index'
  mount ShopifyApp::Engine, at: '/'
  resources :options, only: [:update, :edit]
  resources :customizations, only: [:update, :edit]
  #resources :options  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/options', to: 'options#show' 
  
  get '/customizations/edit_alter', to: 'customizations#edit_alter'
end
