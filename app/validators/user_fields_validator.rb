# frozen_string_literal: true

class UserFieldsValidator < ActiveModel::Validator
  extend Memoist

  def validate(record)
    known_field_ids = UserCustomField.where(id: record.fields.keys).index_by(&:id)

    record.fields.each do |field_id, field_value|
      field = known_field_ids[field_id.to_i]

      next record.errors.add(:fields, :unknown, field_id: field_id) if field.blank?
      next if field.class.validator.blank?

      field.class.validator.new(attributes: record.attributes, field_id: field_id, **field.validator_options)
                           .validate_each(record, :fields, field_value)
    end
  end
end

