require_relative '../rental'

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
      if books.empty?
        puts "\nNO BOOKS TO RENT!\n"
      elsif peoples.empty?
        puts "\nNO PEOPLE TO RENT!\n"
      else
        puts 'Select a Book: '
        books.each_with_index { |b, i| puts "#{i}: #{b.title} (#{b.author}) " }
        print 'Book Index: '
        book_index = gets.chomp.to_i

        puts "\nSelect a person"
        peoples.each_with_index { |p, i| puts "#{i}: #{p.name}" }
        print 'Person Index: '
        people_index = gets.chomp.to_i

        rental = Rental.new(books[book_index], peoples[people_index])
        rentals.push(rental)

        puts "Rental has been sucessfully created! \n\n"
      end
    end
  end
end
