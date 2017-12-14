Given(/^I meet someone who speaks (.*?)$/) do |language|
  visit_page HelloworldPage
  @language = language_key language
end

When(/^I say hello$/) do 
  @current_page.selector = @language
end

Then(/^the greeting is "(.*?)"$/) do |greeting|
#  @current_page.greeting.should include greeting       # 'old' rspec syntax
  expect(@current_page.greeting).to include greeting    # current rspec syntax
end


