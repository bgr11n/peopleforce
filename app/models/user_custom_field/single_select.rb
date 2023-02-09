# frozen_string_literal: true

# Representing dynamic field with single select that can be set for {User}.
#
class UserCustomField::SingleSelect < UserCustomField
  validates :values, presence: true

  def self.validator
    UserCustomFieldSingleSelectValidator
  end

  def validator_options
    {in: values}
  end
end
