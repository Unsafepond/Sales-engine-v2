require_relative 'invoice-item'
class InvoiceItemRepo
  attr_reader :invoice_items

  def initialize(csvtable)
    @invoice_items = csvtable
  end

  def make_invoice_items
    invoice_items.by_row.map do |row|
      InvoiceItem.new(row[:id], row[:item_id], row[:invoice_id], row[:quantity], row[:unit_price], row[:created_at], row[:updated_at])
    end
  end
end