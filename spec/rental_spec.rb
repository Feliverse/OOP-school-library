require_relative 'spec_helper'

describe Rental do
  context 'Testing Rental class and method' do
    book = Book.new('Game of thrones', 'George R. Martin')
    student = Student.new('C-820', 12, 'Maritza')
    rental = Rental.new(book, student, '2023/04/27')

    it 'Should check if recent person and book were added to Rental' do
      expect(rental.person).to eq student
      expect(rental.book).to eq book
    end

    it 'Method `rentals` should return the book title, person name and date of rental' do
      message = rental.rentals
      expect(message).to eq 'Game of thrones: Maritza 2023/04/27'
    end
  end
end
