class Api::V1::PokemonController < ApiPokemonController
    #we use the custom AplicationController
    before_action :get_pokemon, only: [:show]
    
    #create the functions of your API

    #render all the pokemon is the database
    def index
        #find all the pokemon
        #remember this is the Model.
        @pokemon= Pokemon.all
        #respond via JSON
        render json:{
           data: @pokemon 
        }
    end

    #render the data from the a database
    #according to the ID sent
    #this template will use the JBuilder Gem
    def show
    end

    #manage the creation of a pokemon
    def create
        @pokemon = Pokemon.new(pokemon_info)
        
        #check if the pokemon was saved
        #everything went fine
        if @pokemon.save
            render json:{
               status: "success",
               message: "Pokemon was saved, and sent to the PC Storage",
               data: @pokemon 
            }
        else
            render json:{
                status: "error",
                message: "Pokemon ran away...",
                data: @pokemon.errors
            } 

        
        end    
    end


    #update a pokemon, in case the Pokedex was wrong...
    def update
         @pokemon = Pokemon.find(params[:id])
         #check if record was updated
         if @pokemon.update_attributes(pokemon_info)
            render json:{
                status: "success",
                message: "Pokemon data was updated",
                data: @pokemon
            }
         else
            render json:{
                status: "error",
                message: "Pokemon data could not be changed or updated",
                data: @pokemon.errors
            }   
         end     
    end


    #releases the pokemon
    def destroy
        #get the id
        @pokemon = Pokemon.find(params[:id])
        @pokemon.destroy
        #send the message to the user
        render json:{
            status: "success",
            message: "Pokemon was released",
            data: @pokemon
        }
    end



    private
        #get the id of the pokemon
        #according to the request
        def get_pokemon
            @pokemon= Pokemon.find(params[:id])
        end
        
        #only allows these data to pass on the request
        #this is used when updating the pokemon
        def pokemon_info
            params.permit(:name, :location, :move)
        end

end