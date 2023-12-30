require_relative 'rental'
class Book
  attr_accessor :title, :author
  attr_reader :rentals, :id

  def initialize(title, author, id = Random.rand(1..1000))
    @id = id
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(person, date)
    Rental.new(self, person, date)
  end
end
