# frozen_string_literal: true

# Representing dynamic field with multiple select from provided values that can be set for {User}.
#
class UserCustomField::MultipleSelect < UserCustomField
  validates :values, presence: true

  def self.validator
    UserCustomFieldMultipleSelectValidator
  end

  def validator_options
    {in: values}
  end
end
