require_relative './person'

# to crate a student
class Student < Person
  attr_reader :classroom, :role

  def initialize(classroom, age, name = 'Unknown', parentpermission: true, role: 'student')
    super(age, name, parentpermission: parentpermission)
    @classroom = classroom
    @role = role
  end

  def play_hooky
    '¯(ツ)/¯'
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.student.push(self) unless classroom.student.include?(self)
  end
end
