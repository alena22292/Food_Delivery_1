# TODO: implement the router of your app.
class Router
  def initialize(controller = {})
    @meals_controller = controller[:meals_controller]
    @customers_controller = controller[:customers_controller]
    @running = true
  end

  def run
    puts "Welcome to the restaurant!"
    puts "           --           "

    while @running
      display_tasks
      action = gets.chomp.to_i
      print `clear`
      route_action(action)
    end
  end

  def route_action(action)
    case action
    when 1 then @meals_controller.list
    when 2 then @meals_controller.add
    when 3 then @customers_controller.add
    when 4 then @customers_controller.list
    when 5 then stop
    else
      puts "Please press 1, 2, 3, 4 or 5"
    end
  end

  def display_tasks
    puts ""
    puts "What do you want to do next?"
    puts "1 - List all meals"
    puts "2 - Add a new meal"
    puts "3 - Add a new customer"
    puts "4 - List all customers"
    puts "5 - Stop and exit the program"
  end

  def stop
    @running = false
  end
end
