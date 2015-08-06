class Customer
  attr_reader :id,
              :first_name,
              :last_name,
              :created_at,
              :updated_at,
              :customer_repo

  def initialize(id,
                 first_name,
                 last_name,
                 created_at,
                 updated_at,
                 customer_repo = "")

    @id            = id
    @first_name    = first_name
    @last_name     = last_name
    @created_at    = created_at
    @updated_at    = updated_at
    @customer_repo = customer_repo
  end

  def invoices
    customer_repo.sales_engine.invoice_repository.find_by_customer_id(id)
  end
end