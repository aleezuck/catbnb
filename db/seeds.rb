puts "Seeding users..."

amanda = User.create(
  email: "amanda@gmail.com",
  password: "123456",
  username: "amanda"
)
amanda.save

william = User.create(
  email: "william@gmail.com",
  password: "123456",
  username: "william"
)
william.save

catherine = User.create(
  email: "catherine@gmail.com",
  password: "123456",
  username: "catherine"
)
catherine.save

demo = User.create(
  email: "demo@demo.com",
  password: "demo123456",
  username: "demo"
)
demo.save

puts "Seeding flats..."

flat1 = Flat.create(
  title: "Awesome cat tree",
  location: "5333 Av. Casgrain, Montreal, QC",
  price: 20,
  description: "A lovely cat tree right by a sunny window."
)
photo = URI.open('https://www.therefinedfeline.com/wp-content/uploads/2018/10/Lotus-Espresso-SQ-2000.jpg')
flat1.photos.attach(io: photo, filename: 'photo1', content_type: 'image/jpg')
flat1.user = amanda
flat1.save!

flat2 = Flat.create(
  title: "Comfy cardboard box",
  location: "275 Notre-Dame St., Montreal, QC",
  price: 10,
  description: "A cardboard box, what more could any cat ask for?"
)
photo = URI.open('https://www.comfortzone.com/-/media/Images/ComfortZone-NA/US/Blog/shutterstock_318174701.jpg')
flat2.photos.attach(io: photo, filename: 'photo2', content_type: 'image/jpg')
flat2.user = amanda
flat2.save!

flat3 = Flat.create(
  title: "Cat palace",
  location: "845 Sherbrooke St W, Montreal, QC",
  price: 100,
  description: "A deluxe cat flat with multiple floors."
)
photo = URI.open('https://design-milk.com/images/2020/02/24Storage-The-Cat-Flat-1.jpg')
flat3.photos.attach(io: photo, filename: 'photo3', content_type: 'image/jpg')
flat3.user = amanda
flat3.save!

flat4 = Flat.create(
  title: "Backyard cabin",
  location: "111 Wellington St, Ottawa, ON",
  price: 40,
  description: "A cozy cabin in the outdoors, lots of birds and squirrels to watch!"
)
photo = URI.open('https://pyxis.nymag.com/v1/imgs/711/486/d8297fabeda7f1880ef08532befcfe4626-petsfit-outdoor-triangle-cat-house-.rsocial.w1200.jpg')
flat4.photos.attach(io: photo, filename: 'photo4', content_type: 'image/jpg')
flat4.user = william
flat4.save!

flat5 = Flat.create(
  title: "Cozy cat bed",
  location: "8888 University Dr, Burnaby, BC",
  price: 25,
  description: "A soft and fluffy bed, great for any cat to nap in."
)
photo = URI.open('https://ae01.alicdn.com/kf/H3c6a2dff60b74d3d9dacaaca08d9816dR/Warm-Soft-Cat-Bed-Winter-Warm-House-Cave-Pet-Dog-Soft-Nest-Kennel-Kitten-Bed-House.jpg_Q90.jpg_.webp')
flat5.photos.attach(io: photo, filename: 'photo5', content_type: 'image/jpg')
flat5.user = catherine
flat5.save!

puts "Seeding done!"
