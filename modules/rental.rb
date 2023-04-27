require_relative '../rental'
require_relative 'crud_rental'
require_relative '../book'
require_relative '../student'
require_relative '../teacher'


module RentalListing
  class RentalLister
    def list(rentals, peoples, books)
      if rentals.empty?
        puts "\nNO RENTAL!"
        return
      end

      person_index = select_person_index(peoples)

      unless peoples[person_index]
        puts 'Invalid index'
        return
      end

      print_person_rentals(person_index, rentals, peoples, books)
    end

    def select_person_index(peoples)
      puts 'Select a person by index'
      peoples.each_with_index { |p, i| puts "#{i}: #{p['name']}" }
      print 'Person Index: '
      gets.chomp.to_i
    end

    def print_person_rentals(person_index, rentals, peoples, books)
      person_rentals = rentals.select { |rental| rental['id_person'] == peoples[person_index]['id'] }
      if person_rentals.empty?
        puts 'No Rentals'
      else
        person_rentals.each do |rental|
          book = books.find { |booki| booki['id'] == rental['id_book'] }
          puts "\nDate: #{rental['date']}\nBook: \"#{book['title']}\" by #{book['author']}"
        end
      end
    end
  end

  class RentalCreator
    include CrudRental
    def create(rentals, books, peoples)
      validate_books_and_peoples(books, peoples)

      book_data = select_book(books)

      people_data = select_person(peoples)
      rental = Rental.new(book_data, people_data)
      SaveRental.new.save([rental])
      puts "Rental has been sucessfully created! \n\n"
    end

    def create_student(classroom, age, name, id, parentpermission)
      Student.new(classroom, age, name, id: id, parentpermission: parentpermission)
    end

    def create_teacher(age, specialization, name, id)
      Teacher.new(age, specialization, name, id: id)
    end

    def validate_books(books)
      return unless books.empty?

      puts "\nNO BOOKS TO RENT!\n"
      exit
    end

    def validate_peoples(peoples)
      return unless peoples.empty?

      puts "\nNO PEOPLE TO RENT!\n"
      exit
    end

    def validate_books_and_peoples(books, peoples)
      validate_books(books)
      validate_peoples(peoples)
    end

    def select_book(books)
      puts 'Select a Book:'
      books.each_with_index { |b, i| puts "#{i}: #{b['title']} (#{b['author']})" }
      print 'Book Index: '
      index_book = gets.chomp.to_i
      Book.new(books[index_book]['title'], books[index_book]['author'], books[index_book]['id'])
    end

    def select_person(peoples)
      puts "\nSelect a person:"
      peoples.each_with_index { |p, i| puts "#{i}: #{p['name']}" }
      print 'Person Index: '
      index_people = gets.chomp.to_i

      case peoples[index_people]['role']
      when 'student'
        create_student(
          peoples[index_people]['classroom'], peoples[index_people]['age'],
          peoples[index_people]['name'], peoples[index_people]['id'],
          parentpermission: peoples[index_people]['parentpermission']
        )
      when 'teacher'
        create_teacher(
          peoples[index_people]['age'], peoples[index_people]['specialization'],
          peoples[index_people]['name'], peoples[index_people]['id']
        )
      end
    end
  end
end
