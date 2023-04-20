require_relative './person'

# to crate a student
class Student < Person
  attr_accessor :classroom

  def initialize(age, classroom, name = 'Unknown', parent_permission: true)
    super(age, name, parent_permission)
    @classroom = classroom
  end

  def play_hooky
    '¯(ツ)/¯'
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.student.push(self) unless classroom.include?(self)
  end
end
