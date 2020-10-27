# TODO: require relevant files to bootstrap the app.
# Then you can test your program with:
#   ruby app.rb
require_relative './app/repositories/meal_repository'
require_relative './app/controllers/meals_controller'
require_relative './app/repositories/customer_repository'
require_relative './app/controllers/customers_controller'
require_relative 'router'

csv_file_meal = './data/meals.csv'
csv_file_customer = './data/customers.csv'

meal_repository = MealRepository.new(csv_file_meal)
customer_repository = CustomerRepository.new(csv_file_customer)

meals_controller = MealsController.new(meal_repository)
customers_controller = CustomersController.new(customer_repository)

router = Router.new(meals_controller: meals_controller, customers_controller: customers_controller)

router.run
