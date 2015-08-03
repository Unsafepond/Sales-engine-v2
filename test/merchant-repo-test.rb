require 'minitest/autorun'
require 'minitest/pride'
require 'csv'
require './lib/merchant-repo'

class TestMerchantRepo < Minitest::Test
  def test_we_can_initialize_merchants
    data = CSV.read "./data/fixtures/merchants.csv",
    headers: true, header_converters: :symbol
    merch_repo = MerchantRepo.new(data)
    assert_equal CSV::Table, merch_repo.merchants.class
  end

  def test_we_can_make_merchant_id_with_table
    data = CSV.read "./data/fixtures/merchants.csv",
    headers: true, header_converters: :symbol
    merch_repo = MerchantRepo.new(data)
    assert_equal "1", merch_repo.make_merchants.first.id
  end
end