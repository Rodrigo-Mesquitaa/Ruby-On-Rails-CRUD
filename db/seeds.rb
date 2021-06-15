#populate the database

150.times do   
    Pokemon.create({
       name: Faker::Pokemon.name,
       location: Faker::Pokemon.location,
       move: Faker::Pokemon.move
    })
end    