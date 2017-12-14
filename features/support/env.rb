require 'selenium-webdriver'
require 'page-object'
require 'page-object/page_factory'
#require 'rspec-expectations'
require_relative './helpers'

World(PageObject::PageFactory)

include Helpers

if ENV['HEADLESS'] == 'true'
  require 'headless'

  headless = Headless.new
  headless.start

  at_exit do
    headless.destroy
  end

end

