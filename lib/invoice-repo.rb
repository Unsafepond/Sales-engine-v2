require_relative 'invoice'
class InvoiceRepo
  attr_reader :invoices

  def initialize(csvtable)
    @invoices = csvtable
  end

  def make_invoices
    invoices.by_row.map do |row|
      Invoice.new(row[:id],
                  row[:customer_id],
                  row[:merchant_id],
                  row[:status],
                  row[:created_at],
                  row[:updated_at])
    end
  end
end
