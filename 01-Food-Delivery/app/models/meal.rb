class Meal
  attr_accessor :id
  attr_reader :name, :price

  def initialize(attr = {})
    @name = attr[:name]
    @price = attr[:price]
    @id = attr[:id]
  end
end

