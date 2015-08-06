require_relative 'test_helper'

class TestMerchant < Minitest::Test
  # def setup
  #   null_engine = SalesEngine.new
  # end

  def test_merchant_has_id
    merchant = Merchant.new("1",
                            "Joe",
                            "2012-03-27 14:53:59 UTC",
                            "2012-03-27 14:53:59 UTC")
    assert_equal "1", merchant.id
  end

  def test_merchant_has_name
    merchant = Merchant.new("1",
                            "Joe",
                            "2012-03-27 14:53:59 UTC",
                            "2012-03-27 14:53:59 UTC")
    assert_equal "Joe", merchant.name
  end

  def test_merchant_has_creation_date
    merchant = Merchant.new("1",
                            "Joe",
                            "2012-03-27 14:53:59 UTC",
                            "2012-03-27 14:53:59 UTC")
    assert_equal "2012-03-27 14:53:59 UTC", merchant.created_at
  end

  def test_merchant_has_updated_date
    merchant = Merchant.new("1",
                            "Joe",
                            "2012-03-27 14:53:59 UTC",
                            "2012-03-27 14:53:59 UTC")
    assert_equal "2012-03-27 14:53:59 UTC", merchant.updated_at
  end

  def test_item_method_returns_list_of_items
    engine = SalesEngine.new("./data/fixtures")
    engine.startup
    m_repo = engine.merchant_repository
    merchant = Merchant.new("1",
                            "Joe",
                            "2012-03-27 14:53:59 UTC",
                            "2012-03-27 14:53:59 UTC",
                            m_repo)
    assert_equal 4, merchant.items.count
  end

  def test_item_method_with_no_matches_returns_empty_array
    engine = SalesEngine.new("./data/fixtures")
    engine.startup
    m_repo = engine.merchant_repository
    merchant = Merchant.new("6",
                            "Joe",
                            "2012-03-27 14:53:59 UTC",
                            "2012-03-27 14:53:59 UTC",
                            m_repo)
    assert_equal [], merchant.items
  end

  def test_invoice_method_returns_list_of_invoices
    engine = SalesEngine.new("./data/fixtures")
    engine.startup
    m_repo = engine.invoice_repository
    merchant = Merchant.new("26",
                            "Joe",
                            "2012-03-27 14:53:59 UTC",
                            "2012-03-27 14:53:59 UTC",
                            m_repo)
    assert_equal 2, merchant.invoices.count
  end

  def test_invoice_method_with_no_matches_returns_empty_array
    engine = SalesEngine.new("./data/fixtures")
    engine.startup
    m_repo = engine.merchant_repository
    merchant = Merchant.new("6",
                            "Joe",
                            "2012-03-27 14:53:59 UTC",
                            "2012-03-27 14:53:59 UTC",
                            m_repo)
    assert_equal [], merchant.invoices
  end

  def test_revenue_method_collects_transactions
    engine = SalesEngine.new("./data/fixtures")
    engine.startup
    m_repo = engine.merchant_repository
    merchant = Merchant.new("26",
                            "Joe",
                            "2012-03-27 14:53:59 UTC",
                            "2012-03-27 14:53:59 UTC",
                            m_repo)
    assert_equal 2, merchant.revenue.first.class
  end
  #
  # def test_revenue_returns_revenue_for_a_merchant
  #   engine = SalesEngine.new("./data/fixtures")
  #   engine.startup
  #   m_repo = engine.merchant_repository
  #   merchant = Merchant.new("6",
  #                           "Joe",
  #                           "2012-03-27 14:53:59 UTC",
  #                           "2012-03-27 14:53:59 UTC",
  #                           m_repo)
  #   assert_equal 1.00, merchant.revenue
  # end

end