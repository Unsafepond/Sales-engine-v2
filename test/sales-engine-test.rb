require 'minitest/autorun'
require 'minitest/pride'
require './lib/sales-engine'

class TestSalesEngine < Minitest::Test
  def test_we_can_parse_merchant_data
    engine = SalesEngine.new("./data/fixtures")
    assert_equal CSV::Table, engine.parse("merchants.csv").class
  end

  def test_we_can_parse_data_on_startup
    engine = SalesEngine.new("./data/fixtures")
    assert_equal CSV::Table, engine.startup.class
  end
end