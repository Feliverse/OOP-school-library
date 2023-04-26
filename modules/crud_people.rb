require 'json'
require 'fileutils'
require_relative 'crud/read'
require_relative 'crud/update'

module CrudPeople
  class SavePeople
    def save(people)
      old_data = Read.new.read_file('people')
      new_data = people.map do |person|
        general = { id: person.id, role: person.role, name: person.name, age: person.age }
        if person.role == 'student'
          general[:classroom] = person.classroom
          general[:parentpermission] = person.parentpermission
        elsif person.role == 'teacher'
          general[:specialization] = person.specialization
        end
        general
      end

      total_data = old_data + new_data
      return if total_data.empty?

      Update.new.write_file('people', total_data)
    end
  end

  class ListPeople
    def list
      Read.new.read_file('people') || []
    end
  end
end
