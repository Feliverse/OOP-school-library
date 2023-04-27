require 'spec_helper'

describe Student do
  before :each do
    @student = Student.new 'Testing Lab', 21, 'Steve Job'
  end

  describe '#new' do
    it 'Should create an instance of the Student class' do
      expect(@student).to be_an_instance_of Student
    end

    it 'Should initialize age as 21' do
      expect(@student.age).to be 21
    end

    it 'Should initialize name as Steve Job' do
      expect(@student.name).to eq 'Steve Job'
    end

    it 'Should generate a random number as id between 1 and 100 for the student' do
      expect(@student.id).to be_kind_of Numeric
      expect(@student.id).to be_between(1, 100).inclusive
    end
  end

  describe 'classroom_setter' do
    it 'Should add the student to a classroom' do
      expect(@student.classroom).to eq 'Testing Lab'
    end
  end

  describe 'play_hooky' do
    it 'Should return a string' do
      expect(@student.play_hooky).to eq '¯(ツ)/¯'
    end
  end
end
