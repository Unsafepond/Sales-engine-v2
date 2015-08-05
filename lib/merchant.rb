class Merchant
  attr_reader :id,
              :name,
              :created_at,
              :updated_at,
              :merchant_repo

  def initialize(id, name, created_at, updated_at, merchant_repo = "")
    @id = id
    @name = name
    @created_at = created_at
    @updated_at = updated_at
    @merchant_repo = merchant_repo
  end

  def items
    merchant_repo.sales_engine.item_repository.find_all_by_merchant_id(id)
  end
end