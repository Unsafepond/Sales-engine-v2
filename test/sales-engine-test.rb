require 'minitest/autorun'
require 'minitest/pride'
require './lib/sales-engine'

class TestSalesEngine < Minitest::Test
  def test_we_can_parse_merchant_data
    engine = SalesEngine.new("./data/fixtures")
    assert_equal CSV::Table, engine.parse("merchants.csv").class
  end

  def test_we_can_parse_invoice_data
    engine = SalesEngine.new("./data/fixtures")
    assert_equal CSV::Table, engine.parse("invoices.csv").class
  end

  def test_merchant_repository_method_gives_merchants
    engine = SalesEngine.new("./data/fixtures")
    assert_equal "Schroeder-Jerde",
                 engine.merchant_repository.make_merchants.first.name
  end


end