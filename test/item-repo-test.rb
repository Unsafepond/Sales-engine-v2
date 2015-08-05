require 'minitest/autorun'
require 'minitest/pride'
require 'csv'
require './lib/item-repo'

class TestItemRepository < Minitest::Test
  def test_we_can_initialize_items
    data = CSV.read "./data/fixtures/items.csv",
    headers: true, header_converters: :symbol
    item_repo = ItemRepository.new(data)
    assert_equal CSV::Table, item_repo.item.class
  end

  def test_we_can_make_item_id_with_table
    data = CSV.read "./data/fixtures/items.csv",
    headers: true, header_converters: :symbol
    item_repo = ItemRepository.new(data)
    assert_equal "1", item_repo.make_items.first.id
  end

  def test_we_can_make_item_name_with_table
    data = CSV.read "./data/fixtures/items.csv",
    headers: true, header_converters: :symbol
    item_repo = ItemRepository.new(data)
    assert_equal "Item Qui Esse", item_repo.make_items.first.name
  end

  def test_we_can_make_item_description_with_table
    data = CSV.read "./data/fixtures/items.csv",
    headers: true, header_converters: :symbol
    item_repo = ItemRepository.new(data)
    assert_equal "Nihil autem sit odio inventore deleniti.", item_repo.make_items.first.description
  end

  def test_we_can_make_item_unit_price_with_table
    data = CSV.read "./data/fixtures/items.csv",
    headers: true, header_converters: :symbol
    item_repo = ItemRepository.new(data)
    assert_equal "75107", item_repo.make_items.first.unit_price
  end

  def test_we_can_make_item_merchant_id_with_table
    data = CSV.read "./data/fixtures/items.csv",
    headers: true, header_converters: :symbol
    item_repo = ItemRepository.new(data)
    assert_equal "1", item_repo.make_items.last.merchant_id
  end

  def test_we_can_make_item_creation_date_with_table
    data = CSV.read "./data/fixtures/items.csv",
    headers: true, header_converters: :symbol
    item_repo = ItemRepository.new(data)
    assert_equal "2012-03-27 14:53:59 UTC", item_repo.make_items.last.created_at
  end

  def test_we_can_make_item_update_time_with_table
    data = CSV.read "./data/fixtures/items.csv",
    headers: true, header_converters: :symbol
    item_repo = ItemRepository.new(data)
    assert_equal "2012-03-27 14:53:59 UTC", item_repo.make_items.last.updated_at
  end

  def test_all_method
    data = CSV.read "./data/fixtures/items.csv",
    headers: true, header_converters: :symbol
    item_repo = ItemRepository.new(data)
    assert_equal '1', item_repo.all.first.id
  end

  def test_random_method
    data = CSV.read "./data/fixtures/items.csv",
    headers: true, header_converters: :symbol
    item_repo = ItemRepository.new(data)
    assert_equal Item, item_repo.random.class
  end

  def test_find_by_id_method
    data = CSV.read "./data/fixtures/items.csv",
    headers: true, header_converters: :symbol
    item_repo = ItemRepository.new(data)
    assert_equal "Item Qui Esse", item_repo.find_by_id("1").name
  end

  def test_find_by_name_method
    data = CSV.read "./data/fixtures/items.csv",
    headers: true, header_converters: :symbol
    item_repo = ItemRepository.new(data)
    assert_equal "2",
    item_repo.find_by_name("Item Autem Minima").id
  end

  def test_find_by_description_method
    data = CSV.read "./data/fixtures/items.csv",
    headers: true, header_converters: :symbol
    item_repo = ItemRepository.new(data)
    assert_equal "2",
    item_repo.find_by_description("Cumque consequuntur ad.").id
  end

  def test_find_by_unit_price
    data = CSV.read "./data/fixtures/items.csv",
    headers: true, header_converters: :symbol
    item_repo = ItemRepository.new(data)
    assert_equal "2",
    item_repo.find_by_unit_price("67076").id
  end

  def test_find_by_merchant_id_method
    data = CSV.read "./data/fixtures/items.csv",
    headers: true, header_converters: :symbol
    item_repo = ItemRepository.new(data)
    assert_equal "1",
    item_repo.find_by_merchant_id("1").id
  end

  def test_find_by_created_at_method
    data = CSV.read "./data/fixtures/items.csv",
    headers: true, header_converters: :symbol
    item_repo = ItemRepository.new(data)
    assert_equal "1",
    item_repo.find_by_created_at("2012-03-27 14:53:59 UTC").id
  end

  def test_find_by_updated_at_method
    data = CSV.read "./data/fixtures/items.csv",
    headers: true, header_converters: :symbol
    item_repo = ItemRepository.new(data)
    assert_equal "1",
    item_repo.find_by_updated_at("2012-03-27 14:53:59 UTC").id
  end

  def test_find_all_by_id_method
    data = CSV.read "./data/fixtures/items.csv",
    headers: true, header_converters: :symbol
    item_repo = ItemRepository.new(data)
    assert_equal "Item Qui Esse",
    item_repo.find_all_by_id("1").first.name
  end

  def test_find_all_by_name_method
    data = CSV.read "./data/fixtures/items.csv",
    headers: true, header_converters: :symbol
    item_repo = ItemRepository.new(data)
    assert_equal "3",
    item_repo.find_all_by_name("Item Ea Voluptatum").first.id
  end

  def test_find_all_by_description_method
    data = CSV.read "./data/fixtures/items.csv",
    headers: true, header_converters: :symbol
    item_repo = ItemRepository.new(data)
    assert_equal "3",
    item_repo.find_all_by_description("Sunt officia eum qui molestiae.").first.id
  end

  def test_find_all_by_unit_price_method
    data = CSV.read "./data/fixtures/items.csv",
    headers: true, header_converters: :symbol
    item_repo = ItemRepository.new(data)
    assert_equal "1",
    item_repo.find_all_by_unit_price("75107").first.id
  end

  def test_find_all_by_merchant_id_method
    data = CSV.read "./data/fixtures/items.csv",
    headers: true, header_converters: :symbol
    item_repo = ItemRepository.new(data)
    assert_equal "1",
    item_repo.find_all_by_merchant_id("1").first.id
  end

  def test_find_all_by_created_at_method
    data = CSV.read "./data/fixtures/items.csv",
    headers: true, header_converters: :symbol
    item_repo = ItemRepository.new(data)
    assert_equal "1",
    item_repo.find_all_by_created_at("2012-03-27 14:53:59 UTC").first.id
  end

  def test_find_all_by_updated_at_method
    data = CSV.read "./data/fixtures/items.csv",
    headers: true, header_converters: :symbol
    item_repo = ItemRepository.new(data)
    assert_equal "1",
    item_repo.find_all_by_updated_at("2012-03-27 14:53:59 UTC").first.id
  end

end