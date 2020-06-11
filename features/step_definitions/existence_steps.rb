Given("I am on the homepage") do
  visit "http://localhost:3000/"
end

Then("the directory {string} should exist") do |string|
  visit string
end

