class CustomersView
  def display_customers(customers)
    customers.each do |customer|
      # customer => instance of a Meal
      puts "#{customer.id}. #{customer.name} - #{customer.address}"
    end
  end

  def ask_for(stuff)
    puts "What's the #{stuff} of the customer?"
    return gets.chomp
  end
end
