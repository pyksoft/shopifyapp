class HomeController < ShopifyApp::AuthenticatedController
  def index  
    @option = Option.find(1)    
    @shop = params[:shop]
  end
end
