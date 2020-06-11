Given("I am on the application page") do
  visit 'http://localhost:3000/applications/new'
end

When("I fill out the application") do
  fill_in "first_name", with: "Daniel"
  fill_in "last_name", with: "Le"
  fill_in "email", with: "deafdaniel@tamu.edu"
  fill_in "uin", with: "725001806"
  fill_in "phone_number", with: "2144151310"
  fill_in "graduation_date", with: "2020"
  fill_in "gpa", with: "3.4"
  find("#post_csce_classes").find(:xpath, 'option[2]').select_option
  fill_in "picture", with: "https://drive.google.com/open?id=1J2lSZfIiygbBMiBpBAzsgYVCY4Ppppq2"
  fill_in "transcript", with: "https://drive.google.com/open?id=1J2lSZfIiygbBMiBpBAzsgYVCY4Ppppq2"
  fill_in "resume", with: "https://drive.google.com/open?id=1J2lSZfIiygbBMiBpBAzsgYVCY4Ppppq2"
  fill_in "schedule", with: "https://drive.google.com/open?id=13uQUFSO8JOJmgnf99VlzbBmTLqusdMLP"
  fill_in "comment", with: "hello"
  click_button(class:"ui centered big bg-maroon button")
end

Then("I should be on the View App Status page") do
  url = URI.parse(current_url)
  puts url
  expect(page).to have_content("Thank you for your submission, Daniel! Your application has successfully been created and submitted.")
end

Then("I should be able to view my status") do
  fill_in "email", with: "deafdaniel@tamu.edu"
  click_button(class: "ui big vertical animated button maroon-button")
  expect(page).to have_content("Pending")
end