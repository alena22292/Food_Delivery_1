class MealView
  def display(meals)
    meals.each do |meal|
      puts meal.name
    end
  end

  def ask_for_name
    puts "What is a meal name?"
    p ">"
    gets.chomp
  end

  def ask_for_price
    puts "What is price for the meal?"
    p ">"
    gets.chomp.to_i
  end
end
