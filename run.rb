require_relative './app'
require_relative './book'

class Run
  include App
  include RentalListing
  include BookLisitng
  include PeopleListing

  def initialize
    @books = []
    @peoples = []
    @rentals = []
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
      option = gets.chomp
      show(option)
    end
  end

  def show(option)
    case option
    when '1'
      list_all_books(@books)
    when '2'
      PeopleLister.new.list_all_peoples(@peoples)
    when '6'
      list_rentals(@rentals, @peoples)
    when '7'
      puts 'Exit'
      exit
    else
      create(option)
    end
  end

  def create(option)
    case option
    when '3'
      PersonCreator.new.create_person(@peoples)
    when '4'
      create_book(@books)
    when '5'
      create_rental(@rentals, @books, @peoples)
    end
  end
end
