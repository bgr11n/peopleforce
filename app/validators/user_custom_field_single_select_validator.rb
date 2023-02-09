# frozen_string_literal: true

class UserCustomFieldSingleSelectValidator < ActiveModel::Validations::InclusionValidator
  def validate_each(record, attribute, value)
    return record.errors.add(:fields, :array_not_supported, **options.except(:in, :within).merge(value: value)) if value.is_a?(Array)

    super
  end
end

