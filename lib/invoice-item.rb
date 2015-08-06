class InvoiceItem
  attr_reader :id,
              :item_id,
              :invoice_id,
              :quantity,
              :unit_price,
              :created_at,
              :updated_at,
              :invoice_item_repo

  def initialize(id,
                 item_id,
                 invoice_id,
                 quantity,
                 unit_price,
                 created_at,
                 updated_at,
                 invoice_item_repo = "")
    @id = id
    @item_id = item_id
    @invoice_id = invoice_id
    @quantity = quantity
    @unit_price = unit_price
    @created_at = created_at
    @updated_at = updated_at
    @invoice_item_repo = invoice_item_repo
  end

  def sales_engine
    invoice_item_repo.sales_engine
  end

  def invoice
    sales_engine.invoice_repository.find_by_id(invoice_id)
  end

  def item
    sales_engine.item_repository.find_by_id(item_id)
  end
end