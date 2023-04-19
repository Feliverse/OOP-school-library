# frozen_string_literal: true

require_relative './decorator'

# correct a name to capitalized
class CapitalizeDecorator < Decorator
  def correct_name
    @nameable.correct_name.capitalize
  end
end