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

  def successful_transactions
    transactions.select {|transaction| transaction.success?}
  end

  def successful_invoices
    successful_transactions.flat_map do |transaction|
      customer_repository.find_all_invoices_by_invoice_id(transaction.invoice_id)
    end
  end

  def successful_merchant_ids
    successful_invoices.flat_map {|invoice| invoice.merchant_id}
  end

  def count_merchant_ids
    successful_merchant_ids.inject(Hash.new(0)) { |k, v| k[v] += 1; k}
  end

  def sort_merchant_ids
    count_merchant_ids.sort_by {|k,v| -v}
  end

  def favorite_merchant
    customer_repository.find_merchant_by_merchant_id(sort_merchant_ids.first[0])
  end
end