Shelter.destroy_all
Pet.destroy_all

@shelter_1 = Shelter.create(       name:     "Pet Palace",
                      address:  "12483 Jefferson Drive",
                      city:     "Denver",
                      state:    "CO",
                      zip:      "80205")


@shelter_2 = Shelter.create(       name:     "Save a Pet",
                      address:  "38372 Main",
                      city:     "Fort Collins",
                      state:    "CO",
                      zip:      "80205")

@pet_1 = Pet.create(           image: "https://i.imgur.com/wKls5bM.png",
                      name:  "Ziggy",
                      description: "He's a super chill dude",
                      age: "1",
                      sex: "male",
                      status: "adoptable",
                      shelter_id: @shelter_1.id)

@pet_2 = Pet.create(           image: "https://www.thesprucepets.com/thmb/JN3PLkiEX5HOCqQca7ZrcFkdYV0=/960x0/filters:no_upscale():max_bytes(150000):strip_icc()/GettyImages-962608834-fd496cfed51e4d2abe61c0af864fa681.jpg",
                      name:  "Shadow",
                      description: "He's aged like fine wine",
                      age: "8",
                      sex: "male",
                      status: "adoptable",
                      shelter_id: @shelter_1.id)

@pet_3 = Pet.create(           image: "https://img.buzzfeed.com/buzzfeed-static/static/2018-06/25/6/asset/buzzfeed-prod-web-02/sub-buzz-30033-1529923650-1.jpg?downsize=700%3A%2A&output-quality=auto&output-format=auto&output-quality=auto&output-format=auto&downsize=360:*",
                      name:  "Spazz",
                      description: "Don't let the looks fool you... She's a sweetheart",
                      age: "2",
                      sex: "female",
                      status: "adoptable",
                      shelter_id: @shelter_2.id)

@pet_4 = Pet.create(           image: "https://i.ytimg.com/vi/YEU_FIly708/maxresdefault.jpg",
                      name:  "Winter",
                      description: "Will tend to get in trouble but makes up for it with cuddles",
                      age: "1",
                      sex: "female",
                      status: "adoptable",
                      shelter_id: @shelter_2.id)

@review_1 = @shelter_1.reviews.create({ title: "These guys were ok....ish",
                                        rating: "3",
                                        content: "Puppies were cool, staff not so much.",
                                        image: 'https://i.redd.it/zz62ggz08k021.jpg'})


puts "Created #{Shelter.count} Shelters"
puts "Created #{Pet.count} Pets"
puts "Created #{Review.count} Reviews"
