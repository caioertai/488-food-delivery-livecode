# Direct user intention to the relevant controller action
class Router
  def initialize(meals_controller, customers_controller)
    @meals_controller = meals_controller
    @customers_controller = customers_controller
    @running = true
  end

  def run
    puts "Welcome to the Food Delivery"
    while @running
      display_menu
      action = gets.chomp.to_i
      print `clear`
      dispatch(action)
    end
  end

  private

  def display_menu
    puts "1. List meals"
    puts "2. Add meals"
    puts "3. List customers"
    puts "4. Add customer"
    puts "0. To quit"
  end

  def dispatch(action)
    case action
    when 1 then @meals_controller.list
    when 2 then @meals_controller.add
    when 3 then @customers_controller.list
    when 4 then @customers_controller.add
    when 0 then @running = false
    end
  end
end
