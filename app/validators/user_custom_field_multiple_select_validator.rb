# frozen_string_literal: true

class UserCustomFieldMultipleSelectValidator < ActiveModel::Validations::InclusionValidator
  def validate_each(record, attribute, value)
    return record.errors.add(:fields, :not_array, **options.except(:in, :within).merge(value: value)) unless value.is_a?(Array)

    super
  end
end

