class Rental
  attr_accessor :date, :person, :book

  def initialize(date)
    @date = date
    @book = book
    @person = person
    book.rentals.push(self)
    person.rentals.push(self)
  end
end
