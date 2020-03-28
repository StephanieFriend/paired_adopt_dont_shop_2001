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

@shelter_3 = Shelter.create(        name:     "Pet Oasis",
                      address:  "4563 Royal Avenue",
                      city:     "Fort Collins",
                      state:    "CO",
                      zip:      "80205")

@shelter_4 = Shelter.create(        name:     "Adopt a Pet",
                      address:  "7864 Collins",
                      city:     "Aurora",
                      state:    "CO",
                      zip:      "80205")



@pet_1 = Pet.create(  image: "https://i.imgur.com/wKls5bM.png",
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

@pet_4 = Pet.create(  image: "https://apamo.org/wp-content/uploads/2020/03/A076662.jpg",
                      name:  "Sasha",
                      description: "Stays to herself except when the tin can gets open",
                      age: "4",
                      sex: "female",
                      status: "adoptable",
                      shelter_id: @shelter_4.id)

@pet_5 = Pet.create(  image: "https://www.denvergov.org/content/dam/denvergov/Portals/682/images/AdoptableDog_MainAdoptablesImage.jpg",
                      name:  "Gizmo",
                      description: "Full of energy and a great family dog",
                      age: "4",
                      sex: "male",
                      status: "adoptable",
                      shelter_id: @shelter_3.id)

@pet_6 = Pet.create(  image: "https://g.petango.com/photos/2241/5832e7cd-0325-4037-85ac-d108d894dafd.jpg",
                      name:  "Molly",
                      description: "Sweet and loving",
                      age: "6",
                      sex: "female",
                      status: "adoptable",
                      shelter_id: @shelter_2.id)

@pet_7 = Pet.create(  image: "https://g.petango.com/photos/2241/36841309-3e95-4b45-b411-90df7d99baac.jpg",
                      name:  "Bubbles",
                      description: "He enjoys the outdoors but will never complain about a lazy day inside",
                      age: "3",
                      sex: "male",
                      status: "adoptable",
                      shelter_id: @shelter_3.id)


@review_1 = @shelter_1.reviews.create( title: "These guys were ok....ish",
                                        rating: "3",
                                        content: "Puppies were cool, staff not so much.",
                                        image: 'https://i.redd.it/zz62ggz08k021.jpg')

@review_2 = @shelter_2.reviews.create( title: "Best place to adopt a cat",
                                        rating: "4",
                                        content: "Every visit was easy and simple. Being able to interact with the cats is always fun. Having others volunteers or workers help with the cat interactions was great. ",
                                        image: 'https://www.wellnesspetfood.com/sites/default/files/styles/blog_feature/public/media/images/shutterstock_624899891.jpg?itok=OTYZ3ygu')

@review_2 = @shelter_3.reviews.create( title: "Would highly recommend",
                                      rating: "5",
                                      content: "This shelter goes beyond the call of duty.",
                                      image: 'https://upload.wikimedia.org/wikipedia/commons/1/1e/Dog_in_animal_shelter_in_Washington%2C_Iowa.jpg')

@review_2 = @shelter_4.reviews.create( title: "I will never go back",
                                      rating: "1",
                                      content: "This shelter needs to be inspected. The cleanliness is below average. Staff are never around.",
                                    )

@application_1 = Application.create(
                      name:  "Meg",
                      address: "3827 River Oaks Rd.",
                      city: "Denver",
                      state: "CO",
                      zip: "87638",
                      phone_number: "720-873-3467",
                      description: "I already have several furry friends and they need friends!",
                      pet_id: @pet_3.id)



@application_2 = Application.create(
                      name:  "Mike",
                      address: "4572 Sherman Lane",
                      city: "Denver",
                      state: "CO",
                      zip: "87628",
                      phone_number: "720-563-3583",
                      description: "My dog loves to eat dusters! So why not let him eat dusters with a friend",
                      pet_id: @pet_7.id)


@application_3 = Application.create(
                      name:  "Cory",
                      address: "3278 Wallabee Lane",
                      city: "Denver",
                      state: "CO",
                      zip: "84834",
                      phone_number: "303-283-3367",
                      description: "Since owning my first cat I had to get a standing desk. I want to buy more things so need a reason.",
                      pet_id: @pet_4.id)

puts "Created #{Shelter.count} Shelters"
puts "Created #{Pet.count} Pets"
puts "Created #{Review.count} Reviews"
puts "Created #{Application.count} Applications"
