require 'csv'
require_relative 'merchant-repo'
require_relative 'invoice-repo'
class SalesEngine
  def initialize(path = "./data")
    @path = path
  end

  def parse(file)
    CSV.read "#{@path}/#{file}",
    headers: true, header_converters: :symbol
  end

  def startup
    merchants = parse("merchants.csv")
    invoices = parse("invoices.csv")

    MerchantRepo.new(merchants)
    InvoiceRepo.new(invoices)
  end
end