Factory.define :random_service_invoice_item, :class => ServiceInvoiceItem do |f|
  f.association :invoice, :factory => :random_invoice
  f.hourly_wage 1234
  f.currency '€'
  f.vat 0.19
  f.description { Faker::Lorem.sentence }
  f.started_at { Time.now - 24.hours }
  f.ended_at { Time.now - 16.hours }
end

