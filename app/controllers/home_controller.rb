class HomeController < ShopifyApp::AuthenticatedController
  def index
    
    @shop = ShopifyAPI::Shop.current
    @option = Option.find_by domain: @shop.domain
    if @option.nil?
      @option = Option.new
      @option.domain = @shop.domain
      @option.save
    end

    render 'options/edit'
=begin    
    @customization = @option.customization
    if @customization.nil?
      @customization = Customization.new
      @customization.option = @option
      @customization.save
    end 
=end    
  end

  private
    def add_cors_headers
      response.headers['Access-Control-Allow-Origin'] = '*'
      response.headers['Access-Control-Allow-Methods'] = 'POST, PUT, DELETE, GET, OPTIONS'
      response.headers['Access-Control-Request-Method'] = '*'
      response.headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept, Authorization'
    end
end
