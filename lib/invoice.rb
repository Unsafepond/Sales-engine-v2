class Invoice
  attr_reader :id,
              :customer_id,
              :merchant_id,
              :status,
              :created_at,
              :updated_at,
              :invoice_repo

  def initialize(id,
                 customer_id,
                 merchant_id,
                 status,
                 created_at,
                 updated_at,
                 invoice_repo = "")

    @id          = id
    @customer_id = customer_id
    @merchant_id = merchant_id
    @status      = status
    @created_at  = created_at
    @updated_at  = updated_at
    @invoice_repo = invoice_repo
  end

  def sales_engine
    invoice_repo.sales_engine
  end

  def transactions
    sales_engine.transaction_repository.find_all_by_invoice_id(id)
  end

  def invoice_items
    sales_engine.invoice_item_repository.find_all_by_invoice_id(id)
  end

  def item_ids_from_invoice_items
    invoice_items.map {|item| item.item_id}
  end

  def items
    item_ids_from_invoice_items.flat_map do |id|
      sales_engine.item_repository.find_all_by_id(id)
    end
  end
end