require_relative './person'

class Teacher < Person
  attr_accessor :specialization, :role
  
  def initialize(age, specialization, name = 'Unknown', parentpermission: true, role:'teacher')
    super(age, name, parentpermission: parentpermission)
    @specialization = specialization
    @role = role
  end

  def can_use_services?
    true
  end
end
