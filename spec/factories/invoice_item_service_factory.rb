Factory.define :random_invoice_item_service, :class => InvoiceItemService do |f|
  f.association :invoice, :factory => :random_invoice
  f.hourly_wage 1234
  f.currency '€'
  f.vat 19.0
  f.description { Faker::Lorem.sentence }
  f.started_at { Time.now - 24.hours }
  f.ended_at { Time.now - 16.hours }
end

