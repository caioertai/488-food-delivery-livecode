require "csv"
require_relative "../models/order"

class OrderRepository
  def initialize(csv_path, meal_repository, customer_repository, employee_repository)
    @orders = []
    @csv_path = csv_path
    @meal_repository = meal_repository
    @customer_repository = customer_repository
    @employee_repository = employee_repository
    load_csv
  end

  def undelivered_orders
    # order => instance or Order
    @orders.reject { |order| order.delivered? }
  end

  def create(new_order)
    new_order.id = next_id
    @orders << new_order
    update_csv
  end

  private

  def next_id
    @orders.empty? ? 1 : @orders.last.id + 1
  end

  def update_csv
    # reflecting memory into the CSV
    CSV.open(@csv_path, "wb") do |file|
      # CSV HEADERS
      file << %w[id delivered meal_id customer_id employee_id]
      @orders.each do |order|
        file << [order.id, order.delivered?, order.meal.id, order.customer.id, order.employee.id]
      end
    end
  end

  def load_csv
    csv_options = { headers: true, header_converters: :symbol }
    CSV.foreach(@csv_path, csv_options) do |row|
      # Serialized data from the CSV

      # Typecasting / Deserialization:
      # id          : Integer
      # delivered   : boolean
      # meal_id     : Integer
      # customer_id : Integer
      # employee_id : Integer
      # {:id=>1, :delivered=>false, :meal_id=>1, :customer_id=>2, :employee_id=>1}
      row[:id] = row[:id].to_i
      row[:delivered] = row[:delivered] == "true"
      row[:meal] = @meal_repository.find(row[:meal_id].to_i)
      row[:customer] = @customer_repository.find(row[:customer_id].to_i)
      row[:employee] = @employee_repository.find(row[:employee_id].to_i)
      # {:id=>1, :delivered=>false, :meal=>Meal, :customer=>Customer, :employee=>Employee}

      # Better ruby objects
      @orders << Order.new(row)
    end
  end
end
