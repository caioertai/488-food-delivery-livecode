# Direct user intention to the relevant controller action
class Router
  def initialize(meals_controller, customers_controller, sessions_controller)
    @meals_controller = meals_controller
    @customers_controller = customers_controller
    @sessions_controller = sessions_controller
    @running = true
    @current_user = nil
  end

  def run
    puts "Welcome to the Food Delivery"

    while @running
      # SessionsController#login
      while @current_user.nil?
        @current_user = @sessions_controller.login
      end

      if @current_user.manager?
        display_manager_menu
        action = gets.chomp.to_i
        print `clear`
        dispatch_manager(action)
      else
        display_delivery_guy_menu
        action = gets.chomp.to_i
        print `clear`
        dispatch_delivery_guy(action)
      end
    end
  end

  private

  def display_delivery_guy_menu
    puts "TODO: delivery_guy menu" # read all
    puts "0. To quit"
  end

  def dispatch_delivery_guy(action)
    case action
    when 0 then @running = false
    end
  end

  def display_manager_menu
    puts "1. List meals" # read all
    puts "2. Add meals" # create
    # delete            # destroy
    puts "3. List customers"
    puts "4. Add customer"
    puts "0. To quit"
  end

  def dispatch_manager(action)
    case action
    when 1 then @meals_controller.list
    when 2 then @meals_controller.add
    when 3 then @customers_controller.list
    when 4 then @customers_controller.add
    when 0 then @running = false
    end
  end
end
