ShopifyApp.configure do |config|
  config.application_name = "Validate Address"
  config.api_key = "3b44b20048330a892a2425a6c0d17bd0"
  config.secret = "a546adcdb98b91fd3605c03e1e7cf873"
  config.scope = "read_orders, read_products, write_script_tags"
  config.embedded_app = true
  config.after_authenticate_job = false
  config.session_repository = Shop
  config.scripttags = [
    {event:'onload', src: 'https://validate-address.herokuapp.com/fancy.js'}    
  ]
end
