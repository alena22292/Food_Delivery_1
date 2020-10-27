require_relative '../views/meal_view'
require_relative '../models/meal'


class MealsController
  def initialize(repository)
    @repository = repository
    @view = MealView.new
  end

  def add
    name = @view.ask_for_name
    price = @view.ask_for_price
    meal = Meal.new(name: name, price: price)
    @repository.create(meal)
  end

  def list
    meals = @repository.all
    @view.display(meals)
  end
end

