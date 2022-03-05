
print "Creating users..."

User.destroy_all

u0 = User.create! first_name: "Admin", last_name: "Admin", email: "admin@ga.co", phone: "0478940767", address: "8 st camden", password: "chicken", is_admin: true
u1 = User.create! first_name: "Suraj", last_name: "Sharma", email: "suraj@ga.co", phone: "0478930987", address: "8 st camden", password: "chicken", is_admin: false
u2 = User.create! first_name: "Stanley", last_name: "Chin",email: "steven@ga.co", phone: "043480920", address: "8 st amberville", password: "chicken", is_admin: false
u3 = User.create! first_name: "Frankie", last_name: "Tsoi",email: "franki@ga.co", phone: "047895098", address: "8 st mountanen", password: "chicken", is_admin: false

puts "created #{User.count} users."

####################################################################

print "creating products..."

Product.destroy_all

p1 = Product.create!(
  name: 'Original Sugar Scrub',
  price: 20,
  description: 'Sugar body scrub contains the elements of almond sweet oil, soya bean oil, aloe vera and coconut oil which contains lots of Vitamin E in help with anti- aging and anti wrinkles. The scrub that deeply cleanse your skin as well as moisturizer your skin.',
  stock: 100,
  image: 'IMG_nobg-original.png'
)

p2 = Product.create!(
  name: 'Minty Citrus Sugar Scrub',
  price: 20,
  description: 'Sugar body scrub contains the elements of peppermint oil, soya bean oil, aloe vera and coconut oil which contains lots of Vitamin E in help with anti- aging and anti wrinkles. The scrub that deeply cleanse your skin as well as moisturizer your skin.',
  stock: 100,
  image: 'IMG_nobg-citrus.png'
)

p3 = Product.create!(
  name: 'Vanilla Body Milk',
  price: 23,
  description: 'Hydrate and soothe your skin with our delectably smooth body milk! A light and luscious moisturiser with Jojoba and Avocado Oil to nourish your skin and leave it feeling soft, silky and repaired.',
  stock: 100,
  image: 'IMG_nobg-lotion.png'
)
p4 = Product.create!(
  name: 'Omo Liquid Laundry Detergent ',
  price: 32,
  description: 'We believe that Dirt is Good. Its how kids learn, express their creativity  even bolster their immune systems. Omo laundry detergent will get it clean.',
  stock: 334,
  image: 'https://m.media-amazon.com/images/I/41+ZLBh-zeL._AC_SY1000_.jpg'
)
p5 = Product.create!(
  name: 'Dyson',
  price: 860,
  description: 'What is the best Dyson vacuum cleaner? ... All Dyson vacuum cleaners are engineered to deep clean your home. Our bagless vacuum cleaner technology is designed and relentlessly tested for powerful suction on all floor types.',
  stock: 887,
  image: 'https://dyson-h.assetsadobe2.com/is/image/content/dam/dyson/us/campaigns/lm-assets/Shop-by-format-Cordless-3.jpg?cropPathE=mobile&fit=stretch,1&fmt=pjpeg&wid=640'
)
p6 = Product.create!(
  name: 'Pine o Clean ',
  price: 12,
  description: 'Proven to kill 99.9% of germs/bacteria* and viruses^ (including flu virus^^), cuts through grease & grime and leaves a brilliant shine!.',
  stock: 200,
  image: 'https://s3-ap-southeast-2.amazonaws.com/wc-prod-pim/JPEG_1000x1000/LE8142633_pine_o_cleen_antibacterial_disinfectant_eucalyptus_500ml.jpg'
)
p7 = Product.create!(
  name: 'Omo Liquid Laundry Detergent ',
  price: 22,
  description: 'We believe that Dirt is Good. Its how kids learn, express their creativity and even bolster their immune systems. Omo laundry detergent will get it clean….',
  stock: 100,
  image: 'https://m.media-amazon.com/images/I/41+ZLBh-zeL._AC_SY1000_.jpg'
)
p8 = Product.create!(
  name: 'Earth Choice ',
  price: 16,
  description: 'Clean, protect and restore shine to wooden floors and surfaces, with antibacterial properties to fight bacteria. Plant-based ingredients. Grey water safe.',
  stock: 241,
  image: 'https://naturesorganics.com.au/app/uploads/2018/10/20201001_EarthChoice_WoodenFloorSurface725mLWeb-593x800.png'
)

puts "created #{Product.count} product."

Category.destroy_all
c1=Category.create!(
  name: 'Vegetables/Fruits'
)
c2=Category.create!(
  name: 'Health/Beauty'
)
c3=Category.create!(
  name: 'Snacks/Sweets'
)
c4=Category.create!(
  name: 'Drinks'
)
c5=Category.create!(
  name: 'Frozen'
)
c6=Category.create!(
  name: 'Instant Food'
)
c7=Category.create!(
  name: 'Household'
)

puts "created #{Category.count} categories."
#cateogoreis have many products association - Suraj 
##################################################
c1.products << p1<<p2<<p3<<p4<<p5<<p6<<p7<<p8
print "creating order..."

Order.destroy_all

o1 = Order.create!(
  # user_id: u1.id,
  address: '10 Smith St',
  status: 0
  
)

o2 = Order.create!(

  
  address: '11 Smith St',
  status: 1
)

u0.orders << o1
u0.orders << o2

o3 = Order.create!(
  address: '16 Smith St',
  status: 1

)
u1.orders << o3

o4 = Order.create!(
  address: '120 Smith St',
  status: 1
)

u2.orders << o4

o5 = Order.create!(
  address: '16 calene St',
  status: 1
)

u3.orders << o5


o6 = Order.create!(
  address: '242 Smith St',
  status: 1
)

u2.orders << o6

o7 = Order.create!(
  address: '16 Smith St',
  status: 1
)

u1.orders << o7
o8 = Order.create!(
  address: '16 Smith St',
  status: 1
)

u3.orders << o8


o9 = Order.create!(
  address: '16 Smith St',
  status: 1
)

u2.orders << o9
o10 = Order.create!(
  address: '16 Smith St',
  status: 1
)

u3.orders << o10


puts "created #{Order.count} orders."

#################################################

print "creating order line items..."

OrderLineItem.destroy_all

oli1 = OrderLineItem.create!(
  user_id: u0.id,
  order_id: o1.id,
  qty: 1
)

oli2 = OrderLineItem.create!(
  user_id: u1.id,
  order_id: o2.id,
  qty: 1
)


puts "created #{OrderLineItem.count} order line items."

#######################################################


