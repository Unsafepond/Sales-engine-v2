require_relative 'merchant'
class MerchantRepository
  attr_reader :merchants, :all_merchants

  def initialize(csvtable)
    @merchants = csvtable
    @all_merchants = make_merchants
  end

  def make_merchants
    merchants.by_row.map do |row|
      Merchant.new(row[:id], row[:name], row[:created_at], row[:updated_at])
    end
  end

  def all
    all_merchants
  end

  def random
    all.sample
  end

  def find_by_id(id)
    all.detect {|merchant| merchant.id == id}
  end
end
