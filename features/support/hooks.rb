Before do
  @browser = Selenium::WebDriver.for(:firefox)
end

After do |scenario|
  @browser.close
end
