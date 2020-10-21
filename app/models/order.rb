class Order
  attr_accessor :id
  attr_reader :meal, :customer, :employee

  def initialize(attributes = {})
    # {:id=>1, :delivered=>false, :meal_id=>1, :customer_id=>2, :employee_id=>1}
    @id        = attributes[:id] # Integer
    @delivered = attributes[:delivered] || false # boolean
    @meal      = attributes[:meal]      # Meal
    @customer  = attributes[:customer]  # Customer
    @employee  = attributes[:employee]  # Employee
  end

  def delivered?
    @delivered
  end
end
