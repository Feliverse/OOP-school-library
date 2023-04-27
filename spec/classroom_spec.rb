require_relative 'spec_helper'

describe Classroom do
  context 'Testing Classroom class and method' do
    it 'Should return the label created' do
      classroom = Classroom.new('C-710')
      message = "The new classroom is #{classroom.label}"

      expect(message).to eq 'The new classroom is C-710'
    end
  end

  it 'Should add a classroom to a student' do
    student = Student.new('A-120', 26, 'Felipe')
    classroom = Classroom.new('C-710')
    classroom.add_student(student)

    expect(classroom.students).to include(student)
  end
end
