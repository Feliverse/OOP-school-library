require_relative 'spec_helper'

describe CapitalizeDecorator do
  context 'Testing for TrimmerDecorator class and correct_name method' do
    it 'Should throw error for not implemented method' do
      nameable = Nameable.new
      expect { nameable.correct_name }.to raise_error(NotImplementedError)
    end
  end
end
