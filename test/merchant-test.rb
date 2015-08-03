require 'minitest/autorun'
require 'minitest/pride'
require './lib/merchant'

class TestMerchant < Minitest::Test
  def test_merchant_has_id
    merchant = Merchant.new(1, "Joe", "2012-03-27 14:53:59 UTC", "2012-03-27 14:53:59 UTC")
    assert_equal 1, merchant.id
  end

  def test_merchant_has_name
    merchant = Merchant.new(1, "Joe", "2012-03-27 14:53:59 UTC", "2012-03-27 14:53:59 UTC")
    assert_equal "Joe", merchant.name
  end

  def test_merchant_has_creation_date
    merchant = Merchant.new(1, "Joe", "2012-03-27 14:53:59 UTC", "2012-03-27 14:53:59 UTC")
    assert_equal "2012-03-27 14:53:59 UTC", merchant.created_at
  end

  def test_merchant_has_updated_date
    merchant = Merchant.new(1, "Joe", "2012-03-27 14:53:59 UTC", "2012-03-27 14:53:59 UTC")
    assert_equal "2012-03-27 14:53:59 UTC", merchant.updated_at
  end
end