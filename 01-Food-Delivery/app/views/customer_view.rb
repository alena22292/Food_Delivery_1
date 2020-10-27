class CustomerView
  def display(customers)
    customers.each do |customer|
      puts customer.name
    end
  end

  def ask_for_name
    puts "What is your name?"
    p ">"
    gets.chomp
  end

  def ask_for_address
    puts "What is your address?"
    p ">"
    gets.chomp
  end
end
