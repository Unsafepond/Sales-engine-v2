class Item
  attr_reader :id,
              :name,
              :description,
              :unit_price,
              :merchant_id,
              :created_at,
              :updated_at,
              :item_repo

  def initialize(id,
                 name,
                 description,
                 unit_price,
                 merchant_id,
                 created_at,
                 updated_at,
                 item_repo = "")

    @id          = id
    @name        = name
    @description = description
    @unit_price  = unit_price
    @merchant_id = merchant_id
    @created_at  = created_at
    @updated_at  = updated_at
    @item_repo   = item_repo
  end

  def invoice_item
    item_repo.sales_engine.invoice_item_repository.find_all_by_item_id(id)
  end

  def merchant
    item_repo.sales_engine.merchant_repository.find_by_id(merchant_id)
  end
end