require_relative '../student'
require_relative '../teacher'
require_relative 'crud_people' 

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
    include CrudPeople
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

      parentpermission = permission == 'Y'

      student = Student.new(classroom, age, name, parentpermission: parentpermission)
      SavePeople.new.save([student])
      #person.push(student)
      puts "\n Student created successfully!!"
    end
  end

  class TeacherCreator
    include CrudPeople
    def create(person)
      print 'Age: '
      age = gets.chomp
      print 'Name: '
      name = gets.chomp
      print 'Specialization: '
      specialization = gets.chomp     
      teacher = Teacher.new(age, specialization, name)
      SavePeople.new.save([teacher])
      #person.push(teacher)

      puts 'Teacher created successfully!!'
    end
  end
end
