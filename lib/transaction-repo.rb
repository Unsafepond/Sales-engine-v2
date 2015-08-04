require_relative 'transaction'
class TransactionRepository
  attr_reader :transactions

  def initialize(csvtable)
    @transactions = csvtable
  end

  def make_transactions
    transactions.by_row.map do |row|
      Transaction.new(row[:id], row[:invoice_id], row[:credit_card_number], row[:credit_card_expiration_date], row[:result], row[:created_at], row[:updated_at])
    end
  end
end
