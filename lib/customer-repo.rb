require_relative 'customer'
class CustomerRepository
  attr_reader :customers

  def initialize(csvtable)
    @customers = csvtable
  end

  def make_customers
    customers.by_row.map do |row|
      Customer.new(row[:id],
                   row[:first_name],
                   row[:last_name],
                   row[:created_at],
                   row[:updated_at])
    end
  end
end
