require_relative './nameable'

# create a person
class Person < Nameable
  attr_accessor :name, :age, :rentals, :parentpermission
  attr_reader :id

  def initialize(age, name = 'Unknown', parentpermission: true)
    super()
    @id = Random.rand(1..100)
    @name = name
    @age = age
    @parentpermission = parentpermission
    @rentals = []
  end

  def can_use_services?
    of_age? || @parentpermission
  end

  def correct_name
    @name
  end

  def add_rental(book, date)
    Rental.new(self, book, date)
  end

  private

  def of_age?
    @age >= 18
  end
end
