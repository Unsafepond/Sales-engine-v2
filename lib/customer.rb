class Customer
  attr_reader :id,
              :first_name,
              :last_name,
              :created_at,
              :updated_at,
              :customer_repository

  def initialize(id,
                 first_name,
                 last_name,
                 created_at,
                 updated_at,
                 customer_repository = "")

    @id            = id
    @first_name    = first_name
    @last_name     = last_name
    @created_at    = created_at
    @updated_at    = updated_at
    @customer_repository = customer_repository
  end

  def invoices
    customer_repository.find_all_invoices_by_customer_id(id)
  end

  def transactions
    invoices.flat_map do |invoice|
      customer_repository.find_all_transactions_by_invoice_id(invoice.id)
    end
  end

  
end