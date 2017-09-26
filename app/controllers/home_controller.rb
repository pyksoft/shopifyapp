class HomeController < ShopifyApp::AuthenticatedController
  def index  
    @option = Option.find(1)    
    @shop = ShopifyAPI::Shop.current
  end
end
