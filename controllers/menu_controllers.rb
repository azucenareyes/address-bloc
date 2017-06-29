require_relative '../models/address_book'

class MenuController
  #makes us a getter called addr_book
  attr_reader :addr_book

  def initialize()
    #instance of a class
    @addr_book = AddressBook.new
  end

end
