class Employee
  attr_accessor :id
  attr_reader :role, :password, :username

  def initialize(attributes = {})
    @id = attributes[:id]
    @username = attributes[:username] # username:string
    @password = attributes[:password] # password:string
    @role = attributes[:role] # role:string manager/delivery_guy
  end

  def manager?
    @role == "manager"
  end
end
