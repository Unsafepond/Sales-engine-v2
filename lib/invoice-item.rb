class InvoiceItem
  attr_reader :id,
              :item_id,
              :invoice_id,
              :quantity,
              :unit_price,
              :created_at,
              :updated_at,
              :invoice_item_repository

  def initialize(id,
                 item_id,
                 invoice_id,
                 quantity,
                 unit_price,
                 created_at,
                 updated_at,
                 invoice_item_repository = "")
    @id = id
    @item_id = item_id
    @invoice_id = invoice_id
    @quantity = quantity
    @unit_price = unit_price
    @created_at = created_at
    @updated_at = updated_at
    @invoice_item_repository = invoice_item_repository
  end

  def invoice
    invoice_item_repository.find_by_invoice_id(invoice_id)
  end

  def item
    invoice_item_repository.find_by_item_id(item_id)
  end
end