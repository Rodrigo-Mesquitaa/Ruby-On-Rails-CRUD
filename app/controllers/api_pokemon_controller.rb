class ApiPokemonController < ApplicationController
    #create a new controller 
    #that inherits from the default ApplicationController
    before_action :set_default_format

    private
        #set the default format to always be JSON
        def set_default_format
            request.format = :json
        end
    #this way we dont need to add the .json at the end of the request
    #which was needed in order to use jbuilder 
    
    #by the way if you want to return something else than json
    #you would need to configure the function.
end