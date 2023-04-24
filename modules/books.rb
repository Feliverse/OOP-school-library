require_relative '../book'
module BookLisitng
  class BooksLister
    def list(books)
      if books.empty?
        puts "\n NO BOOKS REGISTERED!"
      else
        puts "\n"
        books.each do |book|
          puts "Title:  #{book.title}"
          puts "Author: #{book.author}"
          puts '========================'
          puts
        end
      end
    end
  end

  class BookCreator
    def create(books)
      print "\nTitle:  "
      title = gets.chomp
      print 'Author: '
      author = gets.chomp
      book = Book.new(title, author)
      books.push(book)
      puts "\n Book added sucessfully!"
    end
  end
end
