require_relative 'item'
class ItemRepo
  attr_reader :item

  def initialize(csvtable)
    @item = csvtable
  end

  def make_items
    item.by_row.map do |row|
      Item.new(row[:id],
               row[:name],
               row[:description],
               row[:unit_price],
               row[:merchant_id],
               row[:created_at],
               row[:updated_at])
    end
  end
end
