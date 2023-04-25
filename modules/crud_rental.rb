require 'json'
require 'fileutils'
require_relative 'crud/read'
require_relative 'crud/update'

module CrudRental
  class SaveRental
    def save(rentals)
      old_data = Read.new.read_file('rentals')
      new_data = rentals.map do |rental|
        general = { id_person: rental.person[:id], id_book: rental.book[:id], date: rental.date }
        general
      end
      total_data = old_data + new_data
      return if total_data.empty?

      Update.new.write_file('rentals', total_data)
    end
  end

  class ListRental
    def list
      Read.new.read_file('rentals') || []
    end
  end
end
