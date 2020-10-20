require_relative "../views/meals_view"
require_relative "../models/meal"

class MealsController
  def initialize(meal_repository)
    @meal_repository = meal_repository
    @meals_view = MealsView.new
  end

  # Actions:
  def list
    # Ask REPO for all meals
    meals = @meal_repository.all
    # Ask VIEW to display
    @meals_view.display_meals(meals)
  end

  def add
    # Ask VIEW for name
    meal_name = @meals_view.ask_for("name") # user input:string
    # Ask VIEW for price
    meal_price = @meals_view.ask_for("price").to_i # user input:string
    # Ask Meal for an instance with this info
    new_meal = Meal.new(name: meal_name, price: meal_price)
    # Ask REPO to store it
    @meal_repository.create(new_meal)
  end
end
