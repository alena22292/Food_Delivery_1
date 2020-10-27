class Customer
  attr_accessor :id
  attr_reader :name, :address

  def initialize(attr = {})
    @name = attr[:name]
    @address = attr[:address]
    @id = attr[:id]
  end
end
