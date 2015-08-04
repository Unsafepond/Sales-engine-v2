require 'minitest/autorun'
require 'minitest/pride'
require 'csv'
require './lib/transaction-repo'

class TestTransactionRepository < Minitest::Test
  def test_we_can_initialize_transactions
    data = CSV.read "./data/fixtures/transactions.csv",
    headers: true, header_converters: :symbol
    t_repo = TransactionRepository.new(data)
    assert_equal CSV::Table, t_repo.transactions.class
  end

  def test_we_can_make_transaction_id_with_table
    data = CSV.read "./data/fixtures/transactions.csv",
    headers: true, header_converters: :symbol
    t_repo = TransactionRepository.new(data)
    assert_equal "1", t_repo.make_transactions.first.id
  end

  def test_we_can_make_transaction_credit_card_number_with_table
    data = CSV.read "./data/fixtures/transactions.csv",
    headers: true, header_converters: :symbol
    t_repo = TransactionRepository.new(data)
    assert_equal "4654405418249632", t_repo.make_transactions.first.credit_card_number
  end

  def test_we_can_make_transaction_invoice_id_with_table
    data = CSV.read "./data/fixtures/transactions.csv",
    headers: true, header_converters: :symbol
    t_repo = TransactionRepository.new(data)
    assert_equal "1", t_repo.make_transactions.first.invoice_id
  end

  def test_we_can_make_transaction_credit_card_experation_date_with_table
    data = CSV.read "./data/fixtures/transactions.csv",
    headers: true, header_converters: :symbol
    t_repo = TransactionRepository.new(data)
    assert_equal nil, t_repo.make_transactions.first.credit_card_experation_date
  end

  def test_we_can_make_transaction_result_with_table
    data = CSV.read "./data/fixtures/transactions.csv",
    headers: true, header_converters: :symbol
    t_repo = TransactionRepository.new(data)
    assert_equal "success", t_repo.make_transactions.first.result
  end

  def test_we_can_make_transaction_creation_date_with_table
    data = CSV.read "./data/fixtures/transactions.csv",
    headers: true, header_converters: :symbol
    t_repo = TransactionRepository.new(data)
    assert_equal "2012-03-27 14:54:10 UTC", t_repo.make_transactions.last.created_at
  end

  def test_we_can_make_transaction_update_time_with_table
    data = CSV.read "./data/fixtures/transactions.csv",
    headers: true, header_converters: :symbol
    t_repo = TransactionRepository.new(data)
    assert_equal "2012-03-27 14:54:10 UTC", t_repo.make_transactions.last.updated_at
  end
end