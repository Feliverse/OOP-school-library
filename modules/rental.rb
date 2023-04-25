require_relative '../rental'
require_relative 'crud_rental'

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
          puts "Date: #{rental['date']}, Book: \"#{book['title']}\" by #{book['author']}"
        end
      end
    end
    # def list(rentals, peoples, books)
    #       if rentals.empty?
    #         puts "\n NO RENTAL!"
    #       else
    #         puts "\n Select a person by index"
    #         peoples.each_with_index { |p, i| puts "#{i}: #{p['name']}" }
    #         print 'Person Index: '
    #           if peoples.include?(peoples[gets.chomp.to_i])
    #             person_rentals = rentals.select { |rental| rental['id_person'] == peoples[gets.chomp.to_i]['id'] }
    #           if person_rentals.empty?
    #             puts 'No Rentals'
    #           else
    #             person_rentals.each do |rental|
    #               book = books.find { |booki| booki['id'] == rental['id_book'] }
    #               puts "Date: #{rental['date']}, Book: \"#{book['title']}\" by #{book['author']}"
    #             end
    #           end
    #         else
    #           puts 'NO RENTALS'
    #         end
    #       end
    #     end
  end

  class RentalCreator
    include CrudRental
    def create(_rentals, books, peoples)
      if books.empty?
        puts "\nNO BOOKS TO RENT!\n"
      elsif peoples.empty?
        puts "\nNO PEOPLE TO RENT!\n"
      else
        puts 'Select a Book: '
        books.each_with_index { |b, i| puts "#{i}: #{b['title']} (#{b['author']}) " }
        print 'Book Index: '
        book_data = books[gets.chomp.to_i].to_h.transform_keys(&:to_sym)
        book_data[:rentals] = []
        puts "\nSelect a person"
        peoples.each_with_index { |p, i| puts "#{i}: #{p['name']}" }
        print 'Person Index: '
        people_data = peoples[gets.chomp.to_i].to_h.transform_keys(&:to_sym)
        people_data[:rentals] = []
        rental = Rental.new(book_data, people_data)
        SaveRental.new.save([rental])
        puts "Rental has been sucessfully created! \n\n"
      end
    end
  end
end
