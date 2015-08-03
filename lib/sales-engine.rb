require 'csv'

class SalesEngine
  def initialize(path = "./data")
    @path = path
  end

  def parse(file)
    data = CSV.read "#{@path}/#{file}",
    headers: true, header_converters: :symbol
    return data
  end

  def startup
    merchants = parse("merchants.csv")
  end
end