# coding: utf-8
Factory.define :random_customer, :class => Customer do |f|
  f.name { Faker::Company.name }
  f.number { rand(2**32).to_s(36).upcase }
  f.association :user, :factory => :random_user
  f.email { Faker::Internet.email }
  f.telephone { Faker::PhoneNumber::phone_number }
  f.street { Faker::Address.street_address }
  f.post_code { Faker::Address.zip_code }
  f.city { Faker::Address.city }
  f.country 'Deutschland'
end

