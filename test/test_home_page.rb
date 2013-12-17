require 'selenium-webdriver'
require 'test/unit'

module Test
  class TestHomePage < Test::Unit::TestCase

    def setup
      @driver = Selenium::WebDriver.for :phantomjs
      @driver.navigate.to('http://localhost:4000/')
    end

    def teardown
      @driver.quit
    end

    def test_home_page_title
      element = @driver.find_element(:tag_name, "p")
      assert_equal('Vega Test', element.text)
    end
  end
end