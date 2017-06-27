
 require_relative 'entry'

   class AddressBook
     attr_reader :entries

     def initialize
       @entries = []
     end
 -end
#this is a stub, just like the add_entry method,
#this will take a name, phone and e-mail.
def remove_entry(name, phone, email)
end

   def add_entry(name, phone_number, email)

     index = 0
     entries.each do |entry|

       if name < entry.name
         break
       end
       index+= 1
     end

     entries.insert(index, Entry.new(name, phone_number, email))
   end
 end
