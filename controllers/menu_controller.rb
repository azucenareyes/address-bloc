require_relative '../models/address_book'

class MenuController
  #makes us a getter called addr_book
  attr_reader :address_book

  def initialize()
    #instance of a class
    @address_book = AddressBook.new
  end
# this method has no arguments, so it only produces the side effects(puts)
  def main_menu

    puts "Main Menu - #{address_book.entries.count} entries"
    puts "1 - View all entries"
    puts "2 - Create an entry"
    puts "3 - Search for an entry"
    puts "4 - Import entries from a CSV"
    puts "5 - View entry number n"
    puts "6 - Exit"

    print "Enter your selection: "
    selection = gets.to_i

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
        system "clear"
        select_entry
        main_menu
      when 6
        puts "Good-bye!"
        exit(0)
      else
        system "clear"
        puts "Sorry, that is not a valid input"
        main_menu
    end
  end

  def select_entry
    print "Entry number: "
    entry_number = gets.chomp.to_i
    if entry_number > 0
      # TODO  : conditional statement for errors
      puts address_book.entries[entry_number-1]
    else
      puts "Entry number must be between 1 and #{address_book.entries.length}, inclusive!"
    end
  end

  def show_entry(entry)
    puts entry.to_s
    entry_submenu(entry)
  end

  def view_all_entries
    address_book.entries.each do |entry|
       system "clear"
       show_entry(entry)
    end
    system "clear"
    puts "End of entries"
  end

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

  def entry_submenu(entry)
       # #16
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
