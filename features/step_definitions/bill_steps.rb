Given(/^I am on the view my bill page$/) do
  visit(bill_items_path)
end

Then(/^I see my bill$/) do
  expect(page).to have_css('div.container') 
  expect(page).to have_content('Your Bill')
end