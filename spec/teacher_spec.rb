require 'spec_helper'

describe Teacher do
  before :all do
    @teacher = Teacher.new 44, 'Testing', 'Michael Dell'
  end

  describe '#new' do
    it 'Should create an instance of the Teacher class' do
      expect(@teacher).to be_an_instance_of Teacher
    end

    it "Should initialize specialization as 'Testing'" do
      expect(@teacher.specialization).to eq 'Testing'
    end

    it 'Should initialize age as 44' do
      expect(@teacher.age).to be 44
    end

    it 'Should initialize name as Michael Dell' do
      expect(@teacher.name).to eq 'Michael Dell'
    end

    it 'Should generate a random number as id between 1 and 100 for the teacher' do
      expect(@teacher.id).to be_kind_of Numeric
      expect(@teacher.id).to be_between(1, 100).inclusive
    end
  end

  describe '#can_use_services?' do
    it 'Should always be able to use services' do
      expect(@teacher.can_use_services?).to be_truthy
    end
  end
end
