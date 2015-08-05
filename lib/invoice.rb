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

  def transactions
    invoice_repo.sales_engine.transaction_repository.find_all_by_invoice_id(id)
  end
end