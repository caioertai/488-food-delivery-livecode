class MealsView
  def display_meals(meals)
    meals.each do |meal|
      # meal => instance of a Meal
      puts "#{meal.id}. #{meal.name} - $#{meal.price}"
    end
  end

  def ask_for(stuff)
    puts "What's the #{stuff} of the meal?"
    return gets.chomp
  end
end
