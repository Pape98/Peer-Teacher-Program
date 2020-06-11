Given("I am on the Login Page") do
  visit "http://localhost:3000/login"
end

When("I click {string}") do |string|
  click_link(string)
end

Then("I should be on the Reset Password page") do
  url = URI.parse(current_url)
  puts url
end

Given("I am on the Reset Password Page") do
  visit "http://localhost:3000/resetPassword"
end

When("I enter my email") do
  fill_in "email", with: 'test@peerteach.edu'
  #click_button('Send Me A New Password')
end

Then("I should not be able to login with my old password") do
  #click_button(class: "ui fluid large submit button maroon-button")
  url = URI.parse(current_url)
  puts url
end
