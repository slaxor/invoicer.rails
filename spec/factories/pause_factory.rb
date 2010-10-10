Factory.define :random_pause, :class => Pause do |f|
  f.association :invoice_item_service, :factory => :random_invoice_item_service
  f.started_at { Time.now - 23.hours }
  f.ended_at { Time.now - 22.hours }
  f.description 'Had a little nap'
end

