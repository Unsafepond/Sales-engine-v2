require_relative 'merchant'
class MerchantRepo
  attr_reader :merchants

  def initialize(csvtable)
    @merchants = csvtable
  end

  def make_merchants
    merchants.by_row.map do |row|
      Merchant.new(row[:id], row[:name], row[:created_at], row[:updated_at])
    end
  end
end
