require 'minitest/autorun'
require 'minitest/pride'
require 'csv'
require './lib/invoice-repo'

class TestInvoiceRepo < Minitest::Test
  def test_we_can_initialize_invoices
    data = CSV.read "./data/fixtures/invoices.csv",
    headers: true, header_converters: :symbol
    invoice_repo = InvoiceRepo.new(data)
    assert_equal CSV::Table, invoice_repo.invoices.class
  end

  def test_we_can_make_invoice_id_with_table
    data = CSV.read "./data/fixtures/invoices.csv",
    headers: true, header_converters: :symbol
    invoice_repo = InvoiceRepo.new(data)
    assert_equal "1", invoice_repo.make_invoices.first.id
  end

  def test_we_can_make_invoice_customer_id_with_table
    data = CSV.read "./data/fixtures/invoices.csv",
    headers: true, header_converters: :symbol
    invoice_repo = InvoiceRepo.new(data)
    assert_equal "1", invoice_repo.make_invoices.first.customer_id
  end

  def test_we_can_make_invoice_merchant_id_with_table
    data = CSV.read "./data/fixtures/invoices.csv",
    headers: true, header_converters: :symbol
    invoice_repo = InvoiceRepo.new(data)
    assert_equal "26", invoice_repo.make_invoices.first.merchant_id
  end

  def test_we_can_make_invoice_status_with_table
    data = CSV.read "./data/fixtures/invoices.csv",
    headers: true, header_converters: :symbol
    invoice_repo = InvoiceRepo.new(data)
    assert_equal "shipped", invoice_repo.make_invoices.first.status
  end

  def test_we_can_make_invoice_creation_date_with_table
    data = CSV.read "./data/fixtures/invoices.csv",
    headers: true, header_converters: :symbol
    invoice_repo = InvoiceRepo.new(data)
    assert_equal "2012-03-24 15:54:10 UTC", invoice_repo.make_invoices.last.created_at
  end

  def test_we_can_make_invoice_update_time_with_table
    data = CSV.read "./data/fixtures/invoices.csv",
    headers: true, header_converters: :symbol
    invoice_repo = InvoiceRepo.new(data)
    assert_equal "2012-03-24 15:54:10 UTC", invoice_repo.make_invoices.last.updated_at
  end
end