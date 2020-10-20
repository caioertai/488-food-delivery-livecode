require_relative "app/models/employee"
require_relative "app/repositories/employee_repository"

ringo = Employee.new(username: "ringo", password: "secret", role: "delivery_guy")
john = Employee.new(username: "john", password: "secret", role: "manager")

employee_repository = EmployeeRepository.new("data/employees.csv")

employee_repository.create(ringo)
employee_repository.create(john)
