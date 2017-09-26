class HomeController < ShopifyApp::AuthenticatedController
  def index
    #@products = ShopifyAPI::Product.find(:all, params: { limit: 10 })
    #@webhooks = ShopifyAPI::Webhook.find(:all)    
    @option = Option.find(1)
  end
end
