Given("I am on the settings page") do
  visit "http://localhost:3000/admin/settings"
end

When("I enter my password correctly") do
  #fill_in "current_password", with: 'Abcd1234'
  #fill_in "new_password", with: 'abc123'
  #fill_in "confirm_new_password", with: 'abc123'
end

Then("I should be able to login with my new password") do
  url = URI.parse(current_url)
  puts url
end

When("I enter my password incorrectly") do
  #fill_in "current_password", with: 'Wrong'
  #fill_in "new_password", with: 'abc'
  #fill_in "confirm_new_password", with: 'abc'
end

Then("I should not be able to login with my new password") do
  visit "http://localhost:3000/login"
  fill_in "email", with: 'test@peerteach.edu'
  fill_in "password", with: 'abc'
  click_button(class: "ui fluid large submit button maroon-button")
  url = URI.parse(current_url)
  puts url
end
