require_relative './person'

class Teacher < Person
  attr_accessor :specialization, :role

  def initialize(age, specialization, name = 'Unknown', id: Random.rand(1..100), parentpermission: true)
    super(age, name, parentpermission: parentpermission)
    @id = id
    @specialization = specialization
    @role = 'teacher'
  end

  def can_use_services?
    true
  end
end
