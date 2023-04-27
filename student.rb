require_relative './person'

# to crate a student
class Student < Person
  attr_reader :classroom, :role

  def initialize(classroom, age, name = 'Unknown', parentpermission: true, id: Random.rand(1..100))
    super(age, name, parentpermission: parentpermission)
    @id = id
    @classroom = classroom
    @role = 'student'
  end

  def play_hooky
    '¯(ツ)/¯'
  end

  def add_classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end
end
