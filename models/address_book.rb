
 require_relative 'entry'

class AddressBook
  attr_reader :entries

  def initialize
    #instance variable containing an instance of Array.
    @entries = [] # Array.new with no arguments
  end

  def add_entry(name, phone_number, email)

    index = 0
    #this is an each loop iterating through the array returned by the entries getter.
    entries.each do |entry|
       #when two strings are being compared, it's alphabetically.
      # if is a conditional statement
      if name < entry.name
         break
      end
      index+= 1
    end

    entries.insert(index, Entry.new(name, phone_number, email))
  end
end
