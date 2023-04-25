require_relative '../book'
require_relative 'crud_book'

module BookLisitng
  class BooksLister
    def list(books)
      if books.empty?
        puts "\n NO BOOKS REGISTERED!"
      else
        puts "\n"
        books.each do |book|
          puts "Title:  #{book['title']}"
          puts "Author: #{book['author']}"
          puts '========================'
          puts
        end
      end
    end
  end

  class BookCreator
    include CrudBook
    def create()
      print "\nTitle:  "
      title = gets.chomp
      print 'Author: '
      author = gets.chomp
      book = Book.new(title, author)
      SaveBook.new.save([book])
      puts "\n Book added sucessfully!"
    end
  end
end
