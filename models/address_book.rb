
 require_relative 'entry'

class AddressBook
  attr_reader :entries

  def initialize
    @entries = []
  end
#this is a stub, just like the add_entry method,
# this will take a name, phone and e-mail.
  def remove_entry(name, phone_number, email)
    # iterate over entries
    index = 0
    entries.each do |entry|
      #entry is an instance with a method of emial, which is a getter
      #email is just an argument
      if entry.email == email &&
         entry.phone_number == phone_number &&
         entry.name == name
        break
      end
      index += 1
    end
    entries.delete_at(index)
  end

  def add_entry(name, phone_number, email)

    index = 0
    entries.each do |entry|

      if name < entry.name
        break
      else
        index+= 1
      end
    end

    entries.insert(index, Entry.new(name, phone_number, email))
  end
end
