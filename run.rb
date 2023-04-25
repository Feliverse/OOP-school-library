require_relative './app'
require_relative './book'
require_relative 'modules/crud_book'
require_relative 'modules/crud_people'
require_relative 'modules/crud_rental'

class Run
  include App
  include RentalListing
  include BookLisitng
  include PeopleListing
  include CrudBook
  include CrudPeople
  include CrudRental

  def initialize
    @books = ListBook.new.list
    @peoples = ListPeople.new.list
    @rentals = ListRental.new.list
  end

  def main
    loop do
      puts "\n\n Welcome to School Library APP! \n\n"
      print 'Please Choose an option by enerin a number: '
      puts "
        1 - List all books
        2 - List all people
        3 - Create a person
        4 - Create a book
        5 - Create a rental
        6 - List all rentals for a given person id
        7 - Exit
        "
      print 'option: '

      begin
        option = Integer(gets.chomp)
        show(option)
      rescue ArgumentError
        puts 'Invalid input. Please enter a number'
      end
    end
  end

  def show(option)
    case option
    when 1
      BooksLister.new.list(@books)
    when 2
      PeopleLister.new.list(@peoples)
    when 6
      RentalLister.new.list(@rentals, @peoples, @books)
    when 7
      puts 'Exit'
      exit
    else
      create(option)
    end
  end

  def create(option)
    case option
    when 3
      PersonCreator.new.create(@peoples)
      @peoples = ListPeople.new.list
    when 4
      BookCreator.new.create
      @books = ListBook.new.list
    when 5
      RentalCreator.new.create(@rentals, @books, @peoples)
      @rentals = ListRental.new.list
    end
  end
end
