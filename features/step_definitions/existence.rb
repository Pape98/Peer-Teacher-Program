Given("I am on the homepage") do
end

Then("the directory {string} should exist") do |string|
  !Dir[string].empty?
end
