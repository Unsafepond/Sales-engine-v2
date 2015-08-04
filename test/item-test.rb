require 'minitest/autorun'
require 'minitest/pride'
require './lib/item'

class TestItem < Minitest::Test
  def test_item_has_id
    item = Item.new(1,
                    "Item Qui Esse",
                    "Nihil autem sit odio inventore deleniti.",
                    75107,
                    1,
                    "2012-03-27 14:53:59 UTC",
                    "2012-03-27 14:53:59 UTC")
    assert_equal 1, item.id
  end

  def test_item_has_name
    item = Item.new(1,
                    "Item Qui Esse",
                    "Nihil autem sit odio inventore deleniti.",
                    75107,
                    1,
                    "2012-03-27 14:53:59 UTC",
                    "2012-03-27 14:53:59 UTC")
    assert_equal "Item Qui Esse", item.name
  end

  def test_item_has_description
    item = Item.new(1,
                    "Item Qui Esse",
                    "Nihil autem sit odio inventore deleniti.",
                    75107,
                    1,
                    "2012-03-27 14:53:59 UTC",
                    "2012-03-27 14:53:59 UTC")
    assert_equal "Nihil autem sit odio inventore deleniti.", item.description
  end

  def test_item_has_unit_price
    item = Item.new(1,
                    "Item Qui Esse",
                    "Nihil autem sit odio inventore deleniti.",
                    75107,
                    1,
                    "2012-03-27 14:53:59 UTC",
                    "2012-03-27 14:53:59 UTC")
    assert_equal 75107, item.unit_price
  end

  def test_item_has_merchant_id
    item = Item.new(1,
                    "Item Qui Esse",
                    "Nihil autem sit odio inventore deleniti.",
                    75107,
                    1,
                    "2012-03-27 14:53:59 UTC",
                    "2012-03-27 14:53:59 UTC")
    assert_equal 1, item.merchant_id
  end

  def test_item_has_creation_date
    item = Item.new(1,
                    "Item Qui Esse",
                    "Nihil autem sit odio inventore deleniti.",
                    75107,
                    1,
                    "2012-03-27 14:53:59 UTC",
                    "2012-03-27 14:53:59 UTC")
    assert_equal "2012-03-27 14:53:59 UTC", item.created_at
  end

  def test_item_has_updated_date
    item = Item.new(1,
                    "Item Qui Esse",
                    "Nihil autem sit odio inventore deleniti.",
                    75107,
                    1,
                    "2012-03-27 14:53:59 UTC",
                    "2012-03-27 14:53:59 UTC")
    assert_equal "2012-03-27 14:53:59 UTC", item.updated_at
  end
end