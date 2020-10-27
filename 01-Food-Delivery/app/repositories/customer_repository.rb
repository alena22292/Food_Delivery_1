require 'csv'
require_relative '../models/customer'

class CustomerRepository
  def initialize(csv_file)
    @csv_file = csv_file
    @customers = []
    @next_id = 1
    read_csv if File.exist?(@csv_file)
  end

  def read_csv
    csv_options = { headers: :first_row, header_converters: :symbol }
    CSV.foreach(@csv_file, csv_options) do |row|
      row[:id] = row[:id].to_i
      @customers << Customer.new(row)
      @next_id = @customers.last.id + 1 unless @customers.empty?
    end
  end

  def write_csv
    CSV.open(@csv_file, 'wb') do |csv|
      csv << %w[id name address]
      @customers.each do |customer|
        csv << [customer.id, customer.name, customer.address]
      end
    end
  end

  def all
    @customers
  end

  def find(customer_id)
    read_csv
    @customers.find { |customer| p customer if customer.id == customer_id }
  end

  def create(customer)
    customer.id = @next_id
    @customers << customer
    @next_id += 1
    write_csv
  end
end
