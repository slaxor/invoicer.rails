# coding: utf-8
Factory.define :random_invoicing_party, :class => InvoicingParty do |f|
  f.association :user, :factory => :random_user
  f.name { Faker::Name.name }
  f.co_line
  f.email { Faker::Internet.email }
  f.telephone { Faker::PhoneNumber.phone_number }
  f.street { Faker::Address.street_address }
  f.post_code { Faker::Address.zip_code }
  f.city { Faker::Address.city }
  f.vatid { "DE #{rand(10**10)}" }
  f.taxnumber { "#{rand(10**3)}/#{rand(10**5)}-#{rand(10**4)}" }
  f.currency '€'
  f.bank { Faker::Company.name }
  f.bank_account_number { "#{rand(10**12)}" }
  f.bank_sort_code { "#{rand(10**10)}" }
  f.country 'Germany'
end

