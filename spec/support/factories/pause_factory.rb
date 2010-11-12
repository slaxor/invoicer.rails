# coding: utf-8
Factory.define :random_pause, :class => Pause do |f|
  f.association :service_invoice_item, :factory => :random_service_invoice_item
  f.started_at { Time.now - 23.hours }
  f.ended_at { Time.now - 22.hours }
  f.description 'Had a little nap'
end

