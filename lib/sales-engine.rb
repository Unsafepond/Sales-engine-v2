require 'csv'
require_relative 'merchant-repo'
require_relative 'invoice-repo'
require_relative 'invoice-item-repo'
require_relative 'customer-repo'
require_relative 'transaction-repo'
require_relative 'item-repo'


class SalesEngine

  attr_reader :merchant_repository,
              :invoice_repository,
              :invoice_item_repository,
              :customer_repository,
              :transaction_repository,
              :item_repository

  def initialize(path = "./data")
    @path = path
    startup
  end

  def parse(file)
    CSV.read "#{@path}/#{file}",
    headers: true, header_converters: :symbol
  end

  def startup
    merchants     = parse("merchants.csv")
    invoices      = parse("invoices.csv")
    invoice_items = parse("invoice_items.csv")
    customers     = parse("customers.csv")
    transactions  = parse("transactions.csv")
    items         = parse("items.csv")

    @merchant_repository     = MerchantRepository.new(merchants, self)
    @invoice_repository      = InvoiceRepository.new(invoices, self)
    @invoice_item_repository = InvoiceItemRepository.new(invoice_items)
    @customer_repository     = CustomerRepository.new(customers)
    @transaction_repository  = TransactionRepository.new(transactions)
    @item_repository         = ItemRepository.new(items)
  end
end