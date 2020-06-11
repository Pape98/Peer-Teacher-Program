Given("I am on the login page") do
  visit "http://localhost:3000/login"
end

When("I fill out my login information and click Login") do
  fill_in "email", with: 'test@peerteach.edu'
  fill_in "password", with: 'Abcd1234'
  click_button(class: "ui fluid large submit button maroon-button")
end

Then("I should be on admin home page")  do
  visit "http://localhost:3000/admin/home"
end

Then("I should be able to visit the pages:") do |table|
  pages = table.raw
  pages.each do |url|
    url = "http://localhost:3000/admin/" + url[0]
    visit url
  end
end

When("I fill out my login information wrong and click login") do
  fill_in "email", with: 'wrongemail@tamu.edu'
  fill_in "password", with: 'wrognpassword'
  click_button(class: "ui fluid large submit button maroon-button")
end

Then("I should still be on login page") do
  url = URI.parse(current_url)
  puts url
end