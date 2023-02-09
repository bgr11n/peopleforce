# frozen_string_literal: true

# Representing dynamic field with type number that can be set for {User}.
#
class UserCustomField::Number < UserCustomField
  def self.validator
    ActiveModel::Validations::NumericalityValidator
  end
end
