class SessionsView
  def ask_for(stuff)
    puts "Type your #{stuff}:"
    return gets.chomp
  end

  def welcome(user)
    puts "Welcome #{user.username}"
  end

  def bad_credentials
    puts "Wrong credentials"
  end
end
