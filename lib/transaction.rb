class Transaction
  attr_reader :id,
              :invoice_id,
              :credit_card_number,
              :credit_card_expiration_date,
              :result,
              :created_at,
              :updated_at,
              :transaction_repo

  def initialize(id,
                 invoice_id,
                 credit_card_number,
                 credit_card_experation_date,
                 result,
                 created_at,
                 updated_at,
                 transaction_repo = "")
    @id = id
    @invoice_id = invoice_id
    @credit_card_number = credit_card_number
    @credit_card_expiration_date = credit_card_expiration_date
    @result = result
    @created_at = created_at
    @updated_at = updated_at
    @transaction_repo = transaction_repo
  end

  def invoice
    transaction_repo.sales_engine.invoice_repository.find_by_id(invoice_id)
  end
end