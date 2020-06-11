Given("I am filling out an Application") do
  visit "http://localhost:3000/applications/new"
end

When("I click on Classes you can peer teach for") do
  find('#post_csce_classes').click
end

Then("I should see the classes:")  do |table|
  csce_classes = table.raw
  csce_classes.each do |csce_class|
    find("option", :text => csce_class[0])
  end
end

Then("I should not see the classes:")  do |table|
  csce_classes = table.raw
  csce_classes.each do |csce_class|
    page.should have_no_content(csce_class[0])
  end
end