class HomeController < ShopifyApp::AuthenticatedController
  def index  
    @shop = ShopifyAPI::Shop.current
    @option = Option.find_by domain: @shop.domain
    if @option.nil? 
      @option = Option.new
      @option.domain = @shop.domain
      @option.save
    end  
  end
end
