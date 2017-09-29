class HomeController < ShopifyApp::AuthenticatedController
  before_action :check_domain, only: [:index, :customize]
  def index
    
  end

  def customize
    redirect_to edit_customization_path(@customization)
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
