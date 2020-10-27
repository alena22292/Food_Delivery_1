require 'csv'
require_relative '../models/meal'
require 'pry'

class MealRepository
  def initialize(csv_file)
    @csv_file = csv_file
    @meals = []
    @next_id = 1
    read_csv if File.exist?(@csv_file)
  end

  def read_csv
    csv_options = { headers: :first_row, header_converters: :symbol }
    CSV.foreach(@csv_file, csv_options) do |row|
      # p row
      row[:id] = row[:id].to_i
      row[:price] = row[:price].to_i
      @meals << Meal.new(row)
      @next_id = @meals.last.id + 1 unless @meals.empty?
    end
  end

  def write_csv
    CSV.open(@csv_file, 'wb') do |csv|
      csv << %w[id name price]
      @meals.each do |meal|
        csv << [meal.id, meal.name, meal.price]
      end
    end
  end

  def all
    @meals
  end

  def find(meal_id)
    read_csv
    @meals.find { |meal| p meal if meal.id == meal_id }
  end

  def create(meal)
    meal.id = @next_id
    @meals << meal
    @next_id += 1
    write_csv
  end
end
