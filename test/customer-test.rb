require_relative "test_helper"

class TestCustomer < Minitest::Test
  def test_customer_has_id
    customer = Customer.new(1,
                            "Joey",
                            "Ondricka",
                            "2012-03-27 14:54:09 UTC",
                            "2012-03-27 14:54:09 UTC")
    assert_equal 1, customer.id
  end

  def test_customer_has_first_name
    customer = Customer.new(1,
                            "Joey",
                            "Ondricka",
                            "2012-03-27 14:54:09 UTC",
                            "2012-03-27 14:54:09 UTC")
    assert_equal "Joey", customer.first_name
  end

  def test_customer_has_last_name
    customer = Customer.new(1,
                            "Joey",
                            "Ondricka",
                            "2012-03-27 14:54:09 UTC",
                            "2012-03-27 14:54:09 UTC")
    assert_equal "Ondricka", customer.last_name
  end

  def test_customer_has_creation_date
    customer = Customer.new(1,
                            "Joey",
                            "Ondricka",
                            "2012-03-27 14:54:09 UTC",
                            "2012-03-27 14:54:09 UTC")
    assert_equal "2012-03-27 14:54:09 UTC", customer.created_at
  end

  def test_customer_has_updated_date
    customer = Customer.new(1,
                            "Joey",
                            "Ondricka",
                            "2012-03-27 14:54:09 UTC",
                            "2012-03-27 14:54:09 UTC")
    assert_equal "2012-03-27 14:54:09 UTC", customer.updated_at
  end

  def test_invoices_method
    engine = SalesEngine.new("./data/fixtures")
    engine.startup
    c_repo = engine.customer_repository
    customer = Customer.new("1",
                            "Joey",
                            "Ondricka",
                            "2012-03-27 14:54:09 UTC",
                            "2012-03-27 14:54:09 UTC",
                            c_repo)
    assert_equal 4, customer.invoices.count
  end

  def test_invoices_method_returns_nil_if_no_matches
    engine = SalesEngine.new("./data/fixtures")
    engine.startup
    c_repo = engine.customer_repository
    customer = Customer.new("77",
                            "Joey",
                            "Ondricka",
                            "2012-03-27 14:54:09 UTC",
                            "2012-03-27 14:54:09 UTC",
                            c_repo)
    assert_equal [], customer.invoices
  end

  def test_transactions_method_returns_transactions
    engine = SalesEngine.new("./data/fixtures")
    engine.startup
    c_repo = engine.customer_repository
    customer = Customer.new("1",
                            "Joey",
                            "Ondricka",
                            "2012-03-27 14:54:09 UTC",
                            "2012-03-27 14:54:09 UTC",
                            c_repo)
    assert_equal 3, customer.transactions.count
    assert_equal Transaction, customer.transactions.first.class
  end

  def test_transactions_method_returns_0_if_customer_has_no_transactions
    engine = SalesEngine.new("./data/fixtures")
    engine.startup
    c_repo = engine.customer_repository
    customer = Customer.new("99",
                            "Joey",
                            "Ondricka",
                            "2012-03-27 14:54:09 UTC",
                            "2012-03-27 14:54:09 UTC",
                            c_repo)
    assert_equal 0, customer.transactions.count
  end
end