require_relative 'entry'
 require "csv"

class AddressBook
  #when we refer to book in the spec folder it comes here and
  # depending on the method we attach to it, what it will do.
  # for book.add_entry it will come here create an instance,
  # the finaly insert the data in the right place via lexicographic iteration(order)
  attr_reader :entries

  def initialize
    #instance variable containing an instance of Array.
    @entries = [] # Array.new with no arguments
  end
# this method takes three arguments,
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
    csv_text = File.read(file_name)
    csv = CSV.parse(csv_text, headers: true, skip_blanks: true)

    csv.each do |row|
      row_hash = row.to_hash
      add_entry(row_hash["name"], row_hash["phone_number"], row_hash["email"])
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

  def iterative_search(name)
    entries.each do |entry|
      if name == entry.name
        return entry
      end
    end
    return nil
  end
end
