require_relative 'spec_helper'

describe CapitalizeDecorator do
  context 'Testing for Decorator class and correct_name method' do
    it 'Should throw error for not implemented method' do
      nameable = double(:nameable)
      decorator = Decorator.new(nameable)
      allow(nameable).to receive(:correct_name).and_raise(NotImplementedError)

      expect { decorator.correct_name }.to raise_error(NotImplementedError)
    end
  end
end
