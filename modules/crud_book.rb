require 'json'
require 'fileutils'
require_relative 'crud/read'
require_relative 'crud/update'


module CrudBook
    
  class SaveBook
    def save(books)
      old_data = Read.new.read_file('books')
      new_data = books.map { |book| { id: book.id, title: book.title, author: book.author } }
      total_data = old_data + new_data
      return if total_data.empty?

      Update.new.write_file('books', total_data)
    end
  end

  class ListBook
    def list
      Read.new.read_file('books') || []
    end
  end
end
