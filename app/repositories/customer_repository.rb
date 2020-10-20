require 'csv'
require_relative '../models/customer'

class CustomerRepository
  def initialize(csv_path)
    @customers = []
    @csv_path = csv_path

    load_csv
  end

  def create(new_customer)
    new_customer.id = next_id
    @customers << new_customer
    update_csv
  end

  def all
    @customers
  end

  private

  def next_id
    @customers.empty? ? 1 : @customers.last.id + 1
  end

  def update_csv
    CSV.open(@csv_path, "wb") do |file|
      file << ["id", "name", "address"]
      @customers.each do |customer|
        file << [customer.id, customer.name, customer.address]
      end
    end
  end

  def load_csv
    csv_options = { headers: true, header_converters: :symbol }
    CSV.foreach(@csv_path, csv_options) do |row|

      # Typecasting:
      # id:integer
      row[:id] = row[:id].to_i

      @customers << Customer.new(row)
    end
  end
end
