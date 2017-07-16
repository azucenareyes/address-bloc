# This is a class, model of AddressBook.  To make an instance of an AddressBook, we call AddressBook.new.
require_relative '../models/address_book'

# When the MenuController initialized, it set a property address_book with AddressBook.new -- each instance is initialized with an empty array []
class MenuController
  # makes us a getter called address_book
  attr_reader :address_book

  def initialize
    # instance of a class/model
    @address_book = AddressBook.new
  end
# this method has no arguments, so it only produces the side effects(puts)

# main_menu method prints menu to user and calls methods based on response
  def main_menu
    puts "Main Menu - #{address_book.entries.count} entries"
    puts "1 - View all entries"
    puts "2 - Create an entry"
    puts "3 - Search for an entry"
    puts "4 - Import entries from a CSV"
    puts "5 - Exit"
    print "Enter your selection: "
    selection = gets.to_i
    #  Each case statement except 5 really comes with three directions, the first is to clear the screen, which doesn't
    # actually clear anything in my mind just pushes up the information out of the way on the terminal.
    # the second command is very specific to the choice and the third command just returns the main_menu method back.

    case selection
      when 1
        system "clear"
        view_all_entries
        main_menu
      when 2
        system "clear"
        create_entry
        main_menu
      when 3
        system "clear"
        search_entries
        main_menu
      when 4
        system "clear"
        read_csv
        main_menu
      when 5
        puts "Good-bye!"
        exit(0)
      else
        system "clear"
        puts "Sorry, that is not a valid input"
        main_menu
    end
  end

# iterates through address_book entries array, giving each entry the alias entry
# :entries=[entry,entry,entry,entry].
# p.to_str: articular element in the array, in this case it is a name, phone number and email. we add .to_string to make sure everything is treated as a string.
  def view_all_entries
    address_book.entries.each do |entry|
       system "clear"
       entry_submenu(entry)
    end
    system "clear"
    puts "End of entries"
  end

# create_entry is a method that asks the user for inputs and adds the entry to the address_book
  def create_entry
    system "clear"
     puts "New AddressBloc Entry"
     print "Name: "
     name = gets.chomp
     print "Phone number: "
     phone = gets.chomp
     print "Email: "
     email = gets.chomp
     address_book.add_entry(name, phone, email)
     system "clear"
     puts "New entry created"
  end

# entry_submenu method takes an entry, shows that entry, shows the menu for that entry, takes user input, and does something to that entry based on that input, or returns to another part of the controller (main_menu)
  def entry_submenu(entry)
       # #16
    puts entry.to_s
    puts "n - next entry"
    puts "d - delete entry"
    puts "e - edit this entry"
    puts "m - return to main menu"
    selection = gets.chomp

    case selection
      when "n"
      when "d"
      when "e"
      when "m"
        system "clear"
        main_menu
      else
        system "clear"
        puts "#{selection} is not a valid input"
        entry_submenu(entry)
    end
  end

  def search_entries
  end

  def read_csv
  end
end
