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
# gets is using the STDIN
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

# entry_submenu method takes an entry, shows that entry, shows the menu for
# that entry,
# takes user input, and does something to that entry based on that input, or
# returns to another part of the controller (main_menu)
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
        delete_entry(entry)
      when "e"
        edit_entry(entry)
        entry_submenu(entry)
      when "m"
        system "clear"
        main_menu
      else
        system "clear"
        puts "#{selection} is not a valid input"
        entry_submenu(entry)
    end
  end

  def search_submenu(entry)
    # #12
    puts "\nd - delete entry"
    puts "e - edit this entry"
    puts "m - return to main menu"
    # #13
    selection = gets.chomp
    # #14
    case selection
      when "d"
        system "clear"
        delete_entry(entry)
        main_menu
      when "e"
        edit_entry(entry)
        system "clear"
        main_menu
      when "m"
        system "clear"
        main_menu
      else
        system "clear"
        puts "#{selection} is not a valid input"
        puts entry.to_s
        search_submenu(entry)
    end
  end

  def search_entries
    # #9
    print "Search by name: "
    name = gets.chomp
    # #10
    match = address_book.binary_search(name)
    system "clear"
    # #11
    if match
      puts match.to_s
      search_submenu(match)
    else
      puts "No match found for #{name}"
    end
  end

# asking for a file name,
 # checking if that filename does not exist,
 #if: empty? == true
 #clear the screen
 # print: NoCSV file and show main menu method
# otherwise
  def read_csv
    print "Enter CSV file to import: "
  #store here (file_name) whatever they type in(gets) and ignore the first enter(chomp)
    file_name = gets.chomp

    if file_name.empty?
      system "clear"
      puts "No CSV file read"
      main_menu
    end

    begin
      #store here(entry_count) an instance of a class AddressBook with a called method(.import_from_csv)

      entry_count = address_book.import_from_csv(file_name).count
      system "clear"
      puts "#{entry_count} new entries added from #{file_name}"
    rescue
      puts "#{file_name} is not a valid CSV file, please enter the name of a valid CSV file"
      read_csv
    end
  end

  def delete_entry(entry)
    address_book.entries.delete(entry)
    puts "#{entry.name} has been deleted"
  end

  def edit_entry(entry)
    print "Updated name: "
    new_name = gets.chomp
    print "Updated phone number: "
    new_phone_number = gets.chomp
    print "Updated email: "
    new_email = gets.chomp
    entry.name = new_name if ! new_name.empty?
    entry.phone_number = new_phone_number if ! new_phone_number.empty?
    entry.email = new_email if ! new_email.empty?
    system "clear"
    puts "Updated entry:"
    # We are not calling the to_s method from Entry class, but
    # puts calls to_s automatically.
    puts entry
  end

end
