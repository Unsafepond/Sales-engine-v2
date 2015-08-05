require_relative "test_helper"


class TestInvoice < Minitest::Test
  def test_invoice_has_id
    invoice = Invoice.new(1,
                          1,
                          26,
                          "shipped",
                          "2012-03-25 09:54:09 UTC",
                          "2012-03-25 09:54:09 UTC")
    assert_equal 1, invoice.id
  end

  def test_invoice_has_customer_id
    invoice = Invoice.new(1,
                          1,
                          26,
                          "shipped",
                          "2012-03-25 09:54:09 UTC",
                          "2012-03-25 09:54:09 UTC")
    assert_equal 1, invoice.customer_id
  end

  def test_invoice_has_merchant_id
    invoice = Invoice.new(1,
                          1,
                          26,
                          "shipped",
                          "2012-03-25 09:54:09 UTC",
                          "2012-03-25 09:54:09 UTC")
    assert_equal 26, invoice.merchant_id
  end

  def test_invoice_has_status
    invoice = Invoice.new(1,
                          1,
                          26,
                          "shipped",
                          "2012-03-25 09:54:09 UTC",
                          "2012-03-25 09:54:09 UTC")
    assert_equal "shipped", invoice.status
  end

  def test_invoice_has_creation_date
    invoice = Invoice.new(1,
                          1,
                          26,
                          "shipped",
                          "2012-03-25 09:54:09 UTC",
                          "2012-03-25 09:54:09 UTC")
    assert_equal "2012-03-25 09:54:09 UTC", invoice.created_at
  end

  def test_invoice_has_updated_date
    invoice = Invoice.new("1",
                          "1",
                          "26",
                          "shipped",
                          "2012-03-25 09:54:09 UTC",
                          "2012-03-25 09:54:09 UTC")
    assert_equal "2012-03-25 09:54:09 UTC", invoice.updated_at
  end

  def test_transactions_method_returns_list_of_transactions
    engine = SalesEngine.new("./data/fixtures")
    engine.startup
    i_repo = engine.invoice_repository
    invoice = Invoice.new("1",
                          "1",
                          "26",
                          "shipped",
                          "2012-03-25 09:54:09 UTC",
                          "2012-03-25 09:54:09 UTC",
                          i_repo)
    assert_equal 1, invoice.transactions.count
  end

  def test_transactions_method_returns_an_empty_array_if_no_matches
    engine = SalesEngine.new("./data/fixtures")
    engine.startup
    i_repo = engine.invoice_repository
    invoice = Invoice.new("888",
                          "1",
                          "26",
                          "shipped",
                          "2012-03-25 09:54:09 UTC",
                          "2012-03-25 09:54:09 UTC",
                          i_repo)
    assert_equal [], invoice.transactions
  end
end