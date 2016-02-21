Given(/^I am on the view my bill page$/) do
  stub_request(:get, "http://safe-plains-5453.herokuapp.com/bill.json").to_return(
    body: File.new(Rails.root.join('features','support','fixtures', 'response.json'), status: 200)
  )  
  visit(bill_items_path)
end

Then(/^I see my bill$/) do
  expect(page).to have_css('div.skycom-container') 
  expect(page).to have_content('Your Statement')
end