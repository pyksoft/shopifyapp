ShopifyApp.configure do |config|
  config.application_name = "My Shopify App"
  config.api_key = "c1defe33b8ff58218ca9162ae1dd74e4"
  config.secret = "4f9ad383351af4142183902f43a092ad"
  #config.redirect_url="http://validate-address.herokuapp.com"
  config.scope = "read_orders, read_products"
  config.embedded_app = true
  config.after_authenticate_job = false
  config.session_repository = Shop
end
