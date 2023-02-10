# frozen_string_literal: true

# Representing dynamic field that can be set for {User}.
#
class UserCustomField < ApplicationRecord
  # TODO: Implement DSL for validations, ex:
  #   validate_value_with UserCustomFieldMultipleSelectValidator, options
  def self.validator; end

  def validator_options
    {}
  end
end
