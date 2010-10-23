Given /^the following customers:$/ do |customers|
  Customer.create!(customers.hashes)
end

When /^I delete the (\d+)(?:st|nd|rd|th) customer$/ do |pos|
  visit customers_path
  within("table tr:nth-child(#{pos.to_i+1})") do
    click_link "Destroy"
  end
end

Then /^I should see the following customers:$/ do |expected_customers_table|
  expected_customers_table.diff!(tableish('table tr', 'td,th'))
end
