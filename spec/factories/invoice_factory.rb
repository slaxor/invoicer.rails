Factory.define :random_invoice, :class => Invoice do |f|
  f.association :customer, :factory => :random_customer
  f.association :contact, :factory => :random_contact
  f.association :invoicing_party, :factory => :random_invoicing_party
  f.number { rand(2**32).to_s(36).upcase }
  f.covering_text { Faker::Lorem.paragraph(3) }
  f.paid false
  f.due_on { Time.now }
end

