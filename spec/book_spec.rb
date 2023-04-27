require 'date'

require_relative '../book'
require_relative '../student'

describe Book do
  context 'Testing Book class and method' do
    it 'Should return the recent author and title' do
      book = Book.new('Game of thrones', 'George R. Martin')
      message = "#{book.author} wrote #{book.title}"
      
      expect(message).to eq 'George R. Martin wrote Game of thrones'
    end

    it 'Should validate if created rental is stored in book' do
      book = Book.new('The ring', 'Idk')
      student = Student.new('c-808', 22, 'Anderson')
      date = Date.today
      rental = book.add_rental(student, date)

      expect(book.rentals).to include(rental)
    end
  end
end
