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

# File.read: filename_string -> contents_string
# CSV.parse: csv_string -> CSV::Table (an array-like thing)
# row.to_hash: () -> Hash
#
# This method takes an argument file_name, the file_name is called with a File.read method. The purpose of File.read is
# is to read files different types of possible files. This file will be saved in a local variable called csv_text. I know
# it's local because there is not an @ symbol. The second thing that happens is that the CSV class with a methos of parse is called
# on the csv_text local variable. This file includes headers and should skip blank lines. After the file(csv_text) is parsed it will
# be saved in a local variable called csv. After that the csv will be iterated through with the .each method.
# row is specific to either csv files or hash objects. In arrays we use indexes to iterate, in hash we use object types to iterate
# entries: [entry0,entry1,entry2] row_hash: {object_type:row, object_type: row}. We are storing the iteration in row_hash.
# We are calling the add_entry method with three particular keys within it. "name", "phone_number", and "email"
# @ . @ is for class instances  and the . is for methods
# AddressBook.new is a new instance of AddressBook @ instance variable which is part of the state.
  def import_from_csv(file_name)
    csv_text = File.read(file_name)
    csv = CSV.parse(csv_text, headers: true, skip_blanks: true)

    csv.each do |row|
      row_hash = row.to_hash
      self.add_entry(
        row_hash["name"], row_hash["phone_number"], row_hash["email"]
      )
    end
  end

  def binary_search(name)
    lower = 0
    upper = entries.length - 1

    while lower <= upper
      mid = (lower + upper) / 2
      mid_name = entries[mid].name

      if name == mid_name
        return entries[mid]
      elsif name < mid_name
        upper = mid - 1
      elsif name > mid_name
        lower = mid + 1
      end
    end

    return nil
  end
end
