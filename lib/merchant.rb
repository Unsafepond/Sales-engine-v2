class Merchant
  attr_reader :id,
              :name,
              :created_at,
              :updated_at,
              :merchant_repository

  def initialize(id, name, created_at, updated_at, merchant_repository = "")
    @id = id
    @name = name
    @created_at = created_at
    @updated_at = updated_at
    @merchant_repository = merchant_repository
  end

  def items
    merchant_repository.find_all_items_by_merchant_id(id)
  end

  def invoices
    merchant_repository.find_all_invoices_by_merchant_id(id)
  end

  def all_transactions
    invoices.flat_map do |invoice|
      merchant_repository.all_transactions(invoice.id)
    end
  end

  def successful_transactions
    all_transactions.flat_map {|transaction| transaction if transaction.success?}
  end

  def successful_invoices
    successful_transactions.flat_map do |transaction|
      merchant_repository.find_all_invoices_by_invoice_id(transaction.invoice_id)
    end
  end
  #
  # def successful_invoice_items
  #   successful_invoices.flat_map do |invoice|
  #     sales_engine.invoice_item_repository.find_all_by_invoice_id(invoice.id)
  #   end
  # end
  # #
  # # take all successful transactions and collect those invoices
  # # for each invoice id find quanity * price
  # # add all results
end