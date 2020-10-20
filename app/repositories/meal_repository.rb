require 'csv'
require_relative '../models/meal'

class MealRepository
  def initialize(csv_path)
    @meals = []
    @csv_path = csv_path

    load_csv
  end

  def create(new_meal)
    new_meal.id = next_id
    @meals << new_meal
    update_csv
  end

  def all
    @meals
  end

  private

  def next_id
    @meals.empty? ? 1 : @meals.last.id + 1
  end

  def update_csv
    CSV.open(@csv_path, "wb") do |file|
      file << ["id", "name", "price"]
      @meals.each do |meal|
        file << [meal.id, meal.name, meal.price]
      end
    end
  end

  def load_csv
    csv_options = { headers: true, header_converters: :symbol }
    CSV.foreach(@csv_path, csv_options) do |row|

      # Typecasting:
      # id:integer, price:integer
      row[:id] = row[:id].to_i
      row[:price] = row[:price].to_i

      @meals << Meal.new(row)
    end
  end
end
