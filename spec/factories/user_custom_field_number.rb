# frozen_string_literal: true

FactoryBot.define do
  factory :user_custom_field_number, class: UserCustomField::Number do
    label { 'How old are you?' }
  end
end
