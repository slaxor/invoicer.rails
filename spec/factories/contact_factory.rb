Factory.define :random_contact, :class => Contact do |f|
  f.association :customer, :factory => :random_customer
  f.name { Faker::Name.name }
  f.email { Faker::Internet.email }
  f.telephone { Faker::PhoneNumber.phone_number }
  f.street { Faker::Address.street }
  f.post_code { Faker::Address.zip_code }
end

