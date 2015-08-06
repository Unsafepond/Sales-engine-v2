class Merchant
  attr_reader :id,
              :name,
              :created_at,
              :updated_at,
              :merchant_repo

  def initialize(id, name, created_at, updated_at, merchant_repo = "")
    @id = id
    @name = name
    @created_at = created_at
    @updated_at = updated_at
    @merchant_repo = merchant_repo
  end

  def items
    merchant_repo.find_all_items_by_merchant_id(id)
  end

  def invoices
    merchant_repo.find_all_invoices_by_merchant_id(id)
  end
  #
  # def all_transactions
  #   invoices.flat_map do |invoice|
  #     sales_engine.transaction_repository.find_all_by_invoice_id(invoice.id)
  #   end
  # end
  #
  # def successful_transactions
  #   all_transactions.flat_map {|transaction| transaction if transaction.success?}
  # end
  #
  # def successful_invoices
  #   successful_transactions.flat_map do |transaction|
  #     sales_engine.invoice_repository.find_all_by_id(transaction.invoice_id)
  #   end
  # end
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