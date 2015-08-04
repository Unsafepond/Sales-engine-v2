require 'minitest/autorun'
require 'minitest/pride'
require 'csv'
require './lib/customer-repo'

class TestCustomerRepository < Minitest::Test
  def test_we_can_initialize_customers
    data = CSV.read "./data/fixtures/customers.csv",
    headers: true, header_converters: :symbol
    customer_repo = CustomerRepository.new(data)
    assert_equal CSV::Table, customer_repo.customers.class
  end

  def test_we_can_make_customer_id_with_table
    data = CSV.read "./data/fixtures/customers.csv",
    headers: true, header_converters: :symbol
    customer_repo = CustomerRepository.new(data)
    assert_equal "1", customer_repo.make_customers.first.id
  end

  def test_we_can_make_customer_customer_id_with_table
    data = CSV.read "./data/fixtures/customers.csv",
    headers: true, header_converters: :symbol
    customer_repo = CustomerRepository.new(data)
    assert_equal "Joey", customer_repo.make_customers.first.first_name
  end

  def test_we_can_make_customer_merchant_id_with_table
    data = CSV.read "./data/fixtures/customers.csv",
    headers: true, header_converters: :symbol
    customer_repo = CustomerRepository.new(data)
    assert_equal "Ondricka", customer_repo.make_customers.first.last_name
  end

  def test_we_can_make_customer_creation_date_with_table
    data = CSV.read "./data/fixtures/customers.csv",
    headers: true, header_converters: :symbol
    customer_repo = CustomerRepository.new(data)
    assert_equal "2012-03-27 14:54:10 UTC", customer_repo.make_customers.last.created_at
  end

  def test_we_can_make_customer_update_time_with_table
    data = CSV.read "./data/fixtures/customers.csv",
    headers: true, header_converters: :symbol
    customer_repo = CustomerRepository.new(data)
    assert_equal "2012-03-27 14:54:10 UTC", customer_repo.make_customers.last.updated_at
  end
end