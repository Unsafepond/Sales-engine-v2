require 'minitest/autorun'
require 'minitest/pride'
require 'csv'
require './lib/merchant-repo'

class TestMerchantRepository < Minitest::Test
  def test_we_can_initialize_merchants
    data = CSV.read "./data/fixtures/merchants.csv",
    headers: true, header_converters: :symbol
    merch_repo = MerchantRepository.new(data)
    assert_equal CSV::Table, merch_repo.merchants.class
  end

  def test_we_can_make_merchant_id_with_table
    data = CSV.read "./data/fixtures/merchants.csv",
    headers: true, header_converters: :symbol
    merch_repo = MerchantRepository.new(data)
    assert_equal "1", merch_repo.make_merchants.first.id
  end

  def test_we_can_make_merchant_name_with_table
    data = CSV.read "./data/fixtures/merchants.csv",
    headers: true, header_converters: :symbol
    merch_repo = MerchantRepository.new(data)
    assert_equal "Schroeder-Jerde", merch_repo.make_merchants.first.name
  end

  def test_we_can_make_merchant_creation_date_with_table
    data = CSV.read "./data/fixtures/merchants.csv",
    headers: true, header_converters: :symbol
    merch_repo = MerchantRepository.new(data)
    assert_equal "2012-03-27 14:53:59 UTC", merch_repo.make_merchants.last.created_at
  end

  def test_we_can_make_merchant_update_time_with_table
    data = CSV.read "./data/fixtures/merchants.csv",
    headers: true, header_converters: :symbol
    merch_repo = MerchantRepository.new(data)
    assert_equal "2012-03-27 14:53:59 UTC", merch_repo.make_merchants.last.updated_at
  end

  def test_all_method
    data = CSV.read "./data/fixtures/merchants.csv",
    headers: true, header_converters: :symbol
    merch_repo = MerchantRepository.new(data)
    assert_equal Merchant, merch_repo.all.first.class
  end

  def test_random_method
    data = CSV.read "./data/fixtures/merchants.csv",
    headers: true, header_converters: :symbol
    merch_repo = MerchantRepository.new(data)
    assert_equal Merchant, merch_repo.random.class
  end

  def test_find_by_id_method
    data = CSV.read "./data/fixtures/merchants.csv",
    headers: true, header_converters: :symbol
    merch_repo = MerchantRepository.new(data)
    assert_equal Merchant, merch_repo.find_by_id("2").class
  end

  def test_find_by_name_method
    data = CSV.read "./data/fixtures/merchants.csv",
    headers: true, header_converters: :symbol
    merch_repo = MerchantRepository.new(data)
    assert_equal Merchant, merch_repo.find_by_name("Schroeder-Jerde").class
  end

  def test_find_by_created_at_method
    data = CSV.read "./data/fixtures/merchants.csv",
    headers: true, header_converters: :symbol
    merch_repo = MerchantRepository.new(data)
    assert_equal Merchant, merch_repo.find_by_created_at("2012-03-27 14:53:59 UTC").class
  end

end