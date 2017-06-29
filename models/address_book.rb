
 require_relative 'entry'

   class AddressBook
     attr_reader :entries

     def initialize
       #instance variable containing an instance of Array.
       @entries = [] # Array.new with no arguments
     end
 end

   def add_entry(name, phone_number, email)

     index = 0
     entries.each do |entry|
       #when two strings are being compared, it's alphabetically.
       if name < entry.name
         break
       end
       index+= 1
     end

     entries.insert(index, Entry.new(name, phone_number, email))
   end
 end
