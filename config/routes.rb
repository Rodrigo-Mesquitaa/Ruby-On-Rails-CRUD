Rails.application.routes.draw do
    #create the namespaces
    #and the resources for the pokemon routes
    namespace :api do
      namespace :v1 do
        resources :pokemon
      end  
    end
  end
  