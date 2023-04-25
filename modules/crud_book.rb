require 'json'
require 'fileutils'
module CrudBook
  class ReadBook
    def read(file)
      path = File.join(__dir__, '../data', "#{file}.json")
      return [] unless File.exist?(path)

      data = JSON.parse(File.read(path))
      data.is_a?(Array) ? data : []
    end
  end

  class UpdateBook
    def write(file, data)
      path = File.join(__dir__, '../data', "#{file}.json")

      FileUtils.mkdir_p('./data')

      File.write(path, JSON.pretty_generate(data))
    end
  end

  class SaveBook
    def save(books)
      old_data = ReadBook.new.read('books')
      new_data = books.map { |book| { id: book.id, title: book.title, author: book.author } }
      total_data = old_data + new_data
      return if total_data.empty?

      UpdateBook.new.write('books', total_data)
    end
  end

  class ListBook
    def list
      ReadBook.new.read('books') || []
    end
  end
end
