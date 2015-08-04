require 'minitest/autorun'
require 'minitest/pride'
require 'csv'
require './lib/invoice-item-repo'

class TestInvoiceItemRepo < Minitest::Test
  def test_we_can_initialize_invoice_items
    data = CSV.read "./data/fixtures/invoice_items.csv",
    headers: true, header_converters: :symbol
    i_i_repo = InvoiceItemRepo.new(data)
    assert_equal CSV::Table, i_i_repo.invoice_items.class
  end

  def test_we_can_make_invoice_item_id_with_table
    data = CSV.read "./data/fixtures/invoice_items.csv",
    headers: true, header_converters: :symbol
    i_i_repo = InvoiceItemRepo.new(data)
    assert_equal "1", i_i_repo.make_invoice_items.first.id
  end

  def test_we_can_make_invoice_item_item_id_with_table
    data = CSV.read "./data/fixtures/invoice_items.csv",
    headers: true, header_converters: :symbol
    i_i_repo = InvoiceItemRepo.new(data)
    assert_equal "539", i_i_repo.make_invoice_items.first.item_id
  end

  def test_we_can_make_invoice_item_invoice_id_with_table
    data = CSV.read "./data/fixtures/invoice_items.csv",
    headers: true, header_converters: :symbol
    i_i_repo = InvoiceItemRepo.new(data)
    assert_equal "1", i_i_repo.make_invoice_items.first.invoice_id
  end

  def test_we_can_make_invoice_item_quantity_with_table
    data = CSV.read "./data/fixtures/invoice_items.csv",
    headers: true, header_converters: :symbol
    i_i_repo = InvoiceItemRepo.new(data)
    assert_equal "5", i_i_repo.make_invoice_items.first.quantity
  end

  def test_we_can_make_invoice_item_unit_price_with_table
    data = CSV.read "./data/fixtures/invoice_items.csv",
    headers: true, header_converters: :symbol
    i_i_repo = InvoiceItemRepo.new(data)
    assert_equal "13635", i_i_repo.make_invoice_items.first.unit_price
  end

  def test_we_can_make_invoice_item_creation_date_with_table
    data = CSV.read "./data/fixtures/invoice_items.csv",
    headers: true, header_converters: :symbol
    i_i_repo = InvoiceItemRepo.new(data)
    assert_equal "2012-03-27 14:54:09 UTC", i_i_repo.make_invoice_items.last.created_at
  end

  def test_we_can_make_invoice_item_update_time_with_table
    data = CSV.read "./data/fixtures/invoice_items.csv",
    headers: true, header_converters: :symbol
    i_i_repo = InvoiceItemRepo.new(data)
    assert_equal "2012-03-27 14:54:09 UTC", i_i_repo.make_invoice_items.last.updated_at
  end
end