class OrdersView
  def display_orders(orders)
    orders.each do |order|
      puts "#{order.id}. #{order.meal.name} to de delivered by #{order.employee.username} to #{order.customer.address}"
    end
  end

  def display_select(items)
    # Duck typing
    puts "Which do you want? (type the number)"
    items.each_with_index do |item, index|
      puts "#{index + 1}. #{item.name}"
    end
    gets.chomp.to_i - 1
  end

  def ask_for(stuff)
    puts "What's the #{stuff} of the meal?"
    return gets.chomp
  end
end
