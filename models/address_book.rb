require_relative 'entry'
require "csv"

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

  def import_from_csv(file_name)
    # We're calling the read method on the File class with an argument.
    csv_text = File.read(file_name)
    # Calling the parse method on the CSV class with  three arguments.
    # Our first argument is the file's contents, 2nd argument is an option
    # that tells parse to treat the first line as keys for our rows.
    #Our third argument tells us to skip blank line if they exist.
    csv_table = CSV.parse(csv_text, headers: true, skip_blanks: true)


   #Here we are iterating through the table data and labeling each 
    csv_table.each do |row|
      row_hash = row.to_hash
      add_entry(row_hash["name"], row_hash["phone_number"], row_hash["email"])
    end
  end
end
