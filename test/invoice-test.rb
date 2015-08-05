require 'minitest/autorun'
require 'minitest/pride'
require './lib/invoice'

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
    invoice = Invoice.new(1,
                          1,
                          26,
                          "shipped",
                          "2012-03-25 09:54:09 UTC",
                          "2012-03-25 09:54:09 UTC")
    assert_equal "2012-03-25 09:54:09 UTC", invoice.updated_at
  end
end