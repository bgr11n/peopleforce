# frozen_string_literal: true

# Representing dynamic field that can be set for {User}.
#
class UserCustomField < ApplicationRecord
  def self.validator; end

  def validator_options
    {}
  end
end
