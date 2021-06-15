class Pokemon < ApplicationRecord
    #if we are going to accept data
    #set the values as required
    #this is for the post request
    validates :name, presence: true
    validates :location, presence: true
    validates :move, presence: true
end
