require_relative '../models/address_book'

RSpec.describe AddressBook do
  #We're defining an attribute :book that creates an addressbook for tests inside test module.
  let(:book) { AddressBook.new }
  # this is like book = new copy of class AddressBook

  def check_entry(entry, expected_name, expected_number, expected_email)
    expect(entry.name).to eq expected_name
    expect(entry.phone_number).to eq expected_number
    expect(entry.email).to eq expected_email
  end

  describe "attributes" do
    #This describe block has the commands but it doesn't have the

    it "responds to entries" do
      expect(book).to respond_to(:entries)
    end

    it "initializes entries as an array" do
      expect(book.entries).to be_an(Array)
    end

    it "initializes entries as empty" do
       expect(book.entries.size).to eq(0)
    end
  end


  describe "#add_entry" do

    it "adds only one entry to the address book" do
      book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')

      expect(book.entries.size).to eq(1)
    end

    it "adds the correct information to entries" do
      book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
      new_entry = book.entries[0]

      # This just does test: new_entry.name == 'Ada Lovelace'
      expect(new_entry.name).to eq('Ada Lovelace')
      expect(new_entry.phone_number).to eq('010.012.1815')
      expect(new_entry.email).to eq('augusta.king@lovelace.com')
    end
  end


  describe "#my new assignment test" do
    it "imports the correct number of entries" do
      book.import_from_csv("entries_2.csv")
      book_size = book.entries.size

      expect(book_size).to eq 3
    end

    it "imports the 1st entry" do
      book.import_from_csv("entries_2.csv")
       # Check the first entry
      entry_one = book.entries[0]

      check_entry(entry_one,"Josie","111-222-1234","josie@gmail.com")
    end

    it "imports the 2nd entry" do
      book.import_from_csv("entries_2.csv")
      # Check the second entry
      entry_two = book.entries[2]
      # had to switch the order due to Lexicographic order of entries in book.

      check_entry(entry_two, "Sofia","222-333-4444","sofia@gmail.com")
    end

    it "imports the 3rd entry" do
      book.import_from_csv("entries_2.csv")
      # Check the third entry
      entry_three = book.entries[1]

      check_entry(entry_three, "Rosie","555-666-7777","rosie@gmail.com")
    end
  end

  describe "#import_from_csv" do

    it "imports the correct number of entries" do
      book.import_from_csv("entries.csv")
      book_size = book.entries.size

      expect(book_size).to eq 5
    end

    it "imports the 1st entry" do
      book.import_from_csv("entries.csv")
       # Check the first entry
      entry_one = book.entries[0]

      check_entry(entry_one, "Bill", "555-555-4854", "bill@blocmail.com")
    end

    it "imports the 2nd entry" do
      book.import_from_csv("entries.csv")
      # Check the second entry
      entry_two = book.entries[1]

      check_entry(entry_two, "Bob", "555-555-5415", "bob@blocmail.com")
    end

    it "imports the 3rd entry" do
      book.import_from_csv("entries.csv")
      # Check the third entry
      entry_three = book.entries[2]

      check_entry(entry_three, "Joe", "555-555-3660", "joe@blocmail.com")
    end

    it "imports the 4th entry" do
      book.import_from_csv("entries.csv")
      # Check the fourth entry
      entry_four = book.entries[3]

      check_entry(entry_four, "Sally", "555-555-4646", "sally@blocmail.com")
    end

    it "imports the 5th entry" do
      book.import_from_csv("entries.csv")
      # Check the fifth entry
      entry_five = book.entries[4]

      check_entry(entry_five, "Sussie", "555-555-2036", "sussie@blocmail.com")
    end
  end
end
