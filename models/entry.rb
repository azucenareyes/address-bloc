# This class has superclass Object, by default.
class Entry
  attr_accessor :name, :phone_number, :email
  def initialize(name, phone_number, email)
    @name = name
    @phone_number = phone_number
    @email = email
  end

  #Here we are creating the string we want
  def to_s
    "Name: #{name}\nPhone Number: #{phone_number}\nEmail: #{email}"
  end

end
#this is our stub which is an empty class.
