# coding: utf-8
Factory.define :random_customer, :class => Customer do |f|
  f.name { Faker::Company.name }
  f.number { rand(2**32).to_s(36).upcase }
  f.association :user, :factory => :random_user
end

