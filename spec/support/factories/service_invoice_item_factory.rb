# coding: utf-8
Factory.define :random_service_invoice_item, :class => ServiceInvoiceItem do |f|
  f.association :invoice, :factory => :random_invoice
  f.price 1234
  f.pricing_unit 'Stunden'
  f.pricing_strategy 'hourly'
  f.currency '€'
  f.vat_rate 0.19
  f.description { Faker::Lorem.sentence }
  f.started_at { Time.now - 24.hours }
  f.ended_at { Time.now - 16.hours }
end

