require_relative "../views/sessions_view"

class SessionsController
  def initialize(employee_repository)
    @sessions_view = SessionsView.new
    @employee_repository = employee_repository
  end

  def login
    @employee_repository.all.last
  end

  # def login
  #   # Ask VIEW for an username
  #   username = @sessions_view.ask_for("username")
  #   # Ask VIEW for an password
  #   password = @sessions_view.ask_for("password")
  #   # Check is username and password match any employee instance
  #   employee = @employee_repository.find_by_username(username)
  #   if employee&.password == password
  #     @sessions_view.welcome(employee)
  #     return employee
  #   else
  #     @sessions_view.bad_credentials
  #     return nil
  #   end
  # end
end
