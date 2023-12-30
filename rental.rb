class Rental
  attr_accessor :date, :person, :book

  def initialize(book, person, date = Time.now)
    @date = date
    @book = book
    @person = person
    book.rentals << self
    person.rentals << self
  end

  def rentals
    "#{@book.title}: #{@person.name} #{@date}"
  end
end
