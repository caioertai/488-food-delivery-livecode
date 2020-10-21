require 'csv'
require_relative '../models/employee'

class EmployeeRepository
  def initialize(csv_path)
    @employees = []
    @csv_path = csv_path

    load_csv
  end

  def create(new_employee)
    new_employee.id = next_id
    @employees << new_employee
    update_csv
  end

  def all
    @employees
  end

  def delivery_guys
    @employees.select { |employee| employee.delivery_guy? }
  end

  def find(id)
    @employees.find { |employee| employee.id == id }
  end

  def find_by_username(username)
    @employees.find { |employee| employee.username == username }
  end

  private

  def next_id
    @employees.empty? ? 1 : @employees.last.id + 1
  end

  def update_csv
    CSV.open(@csv_path, "wb") do |file|
      file << ["id", "username", "password", "role"]
      @employees.each do |employee|
        file << [employee.id, employee.username, employee.password, employee.role]
      end
    end
  end

  def load_csv
    csv_options = { headers: true, header_converters: :symbol }
    CSV.foreach(@csv_path, csv_options) do |row|

      # Typecasting:
      # id:integer
      row[:id] = row[:id].to_i

      @employees << Employee.new(row)
    end
  end
end
