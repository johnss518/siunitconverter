Siunitconverter::Application.routes.draw do
  apipie

  namespace :api, :defaults => {:format => :json} do 
    namespace :v1, :only => [:show] do
      get '/unit_conversion(.:format)', to: "units#show"
    end
  end
end
