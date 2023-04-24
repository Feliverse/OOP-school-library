require_relative './student'
require_relative './teacher'
require_relative './book'
require_relative './rental'

module App
  module PeopleListing
    class PeopleLister
      def list(peoples)
        if peoples.empty?
          puts "\n NO PERSON REGISTERED!"
        else
          puts "\n"
          peoples.each do |people|
            puts "ID: #{people.id}"
            puts "NAME:  #{people.name}"
            puts "AGE: #{people.age}"
            puts '========================'
            puts
          end
        end
      end
    end

    class PersonCreator
      def create(person)
        print "\n Do you want to create a Student (1) or a Teacher (2)? [Input the number]: "
        option = gets.chomp
        case option
        when '1'
          StudentCreator.new.create(person)
        when '2'
          TeacherCreator.new.create(person)
        end
      end
    end

    class StudentCreator
      def create(person)
        puts "\n"
        print 'Age: '
        age = gets.chomp
        print 'Name: '
        name = gets.chomp
        print 'Has Parent Permission? [Y/N]: '
        permission = gets.chomp.upcase
        print 'Classroom: '
        classroom = gets.chomp

        parent_permission = permission == 'Y'

        student = Student.new(classroom, age, name, parent_permission:)
        person.push(student)
        puts "\n Student created successfully!!"
      end
    end

    class TeacherCreator
      def create(person)
        print 'Age: '
        age = gets.chomp
        print 'Name: '
        name = gets.chomp
        print 'Specialization: '
        specialization = gets.chomp

        teacher = Teacher.new(age, specialization, name)

        person.push(teacher)

        puts 'Teacher created successfully!!'
      end
    end
  end

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

  module RentalListing
    class RentalLister
      def list(rentals, peoples)
        if rentals.empty?
          puts "\n NO RENTAL!"
        else
          puts "\n Select a person by index"
          peoples.each_with_index { |p, i| puts "#{i}: #{p.name}" }
          print 'Person Index: '
          person_index = gets.chomp.to_i

          name = peoples[person_index].name
          found = false
          puts "\n"
          rentals.each do |rental|
            next if rental.person.name != name

            found = true
            puts rental.rentals
          end

          puts "\nNO RENTAL REGISTERED BY #{name}" unless found
        end
      end
    end

    class RentalCreator
      def create(rentals, books, peoples)
        puts "\n"
        if @books.empty?
          puts "\nNO BOOKS TO RENT!\n"
        elsif @peoples.empty?
          puts "\nNO PEOPLE TO RENT!\n"
        else
          puts 'Select a Book: '
          @books.each_with_index { |b, i| puts "#{i}: #{b.title} (#{b.author}) " }
          print 'Book Index: '
          book_index = gets.chomp.to_i

          puts "\nSelect a person"
          @peoples.each_with_index { |p, i| puts "#{i}: #{p.name}" }
          print 'Person Index: '
          people_index = gets.chomp.to_i

          rental = Rental.new(books[book_index], peoples[people_index])
          rentals.push(rental)

          puts "Rental has been sucessfully created! \n\n"
        end
      end
    end
  end
end
