require 'minitest/autorun'
require 'minitest/pride'
require './lib/invoice-item'

class TestInvoiceItem < Minitest::Test
  def test_invoiceitem_has_id
    invoiceitem = InvoiceItem.new("4",
                                  "535",
                                  "1",
                                  "3",
                                  "2196",
                                  "2012-03-27 14:54:09 UTC",
                                  "2012-03-27 14:54:09 UTC")
    assert_equal "4", invoiceitem.id
  end

  def test_invoiceitem_has_item_id
    invoiceitem = InvoiceItem.new("4",
                                  "535",
                                  "1",
                                  "3",
                                  "2196",
                                  "2012-03-27 14:54:09 UTC",
                                  "2012-03-27 14:54:09 UTC")
    assert_equal "535", invoiceitem.item_id
  end

  def test_invoiceitem_has_invoice_id
    invoiceitem = InvoiceItem.new("4",
                                  "535",
                                  "1",
                                  "3",
                                  "2196",
                                  "2012-03-27 14:54:09 UTC",
                                  "2012-03-27 14:54:09 UTC")
    assert_equal "1", invoiceitem.invoice_id
  end

  def test_invoiceitem_has_quantity
    invoiceitem = InvoiceItem.new("4",
                                  "535",
                                  "1",
                                  "3",
                                  "2196",
                                  "2012-03-27 14:54:09 UTC",
                                  "2012-03-27 14:54:09 UTC")
    assert_equal "3", invoiceitem.quantity
  end

  def test_invoiceitem_has_unit_price
    invoiceitem = InvoiceItem.new("4",
                                  "535",
                                  "1",
                                  "3",
                                  "2196",
                                  "2012-03-27 14:54:09 UTC",
                                  "2012-03-27 14:54:09 UTC")
    assert_equal "2196", invoiceitem.unit_price
  end

  def test_invoiceitem_has_creation_date
    invoiceitem = InvoiceItem.new("4",
                                  "535",
                                  "1",
                                  "3",
                                  "2196",
                                  "2012-03-27 14:54:09 UTC",
                                  "2012-03-27 14:54:09 UTC")
    assert_equal "2012-03-27 14:54:09 UTC", invoiceitem.created_at
  end

  def test_invoiceitem_has_updated_date
    invoiceitem = InvoiceItem.new("4",
                                  "535",
                                  "1",
                                  "3",
                                  "2196",
                                  "2012-03-27 14:54:09 UTC",
                                  "2012-03-27 14:54:09 UTC")
    assert_equal "2012-03-27 14:54:09 UTC", invoiceitem.updated_at
  end
end