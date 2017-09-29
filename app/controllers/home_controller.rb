class HomeController < ShopifyApp::AuthenticatedController
  before_action :check_domain, only: [:index, :custom]
  def index
    
  end

  def custom
    
  end

  private    
    def check_domain
      @shop = ShopifyAPI::Shop.current
      @option = Option.find_by domain: @shop.domain
      if @option.nil?
        @option = Option.new
        @option.domain = @shop.domain
        @option.save
      end
  
      @customization = @option.customization
      if @customization.nil?
        @customization = Customization.new
        @customization.option = @option
        @customization.save
      end 
    end 
end
