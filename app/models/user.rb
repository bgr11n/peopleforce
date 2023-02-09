# frozen_string_literal: true

# Representing user in the system with provided fields.
#
class User < ApplicationRecord
  # TODO: Add email format validation
  validates :email, presence: true, uniqueness: true

  # fields structure:
  #   {
  #     '1': 'value1'
  #     '2': 'value2'
  #   }
  validates_with UserFieldsValidator
end
