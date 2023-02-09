# frozen_string_literal: true

FactoryBot.define do
  factory :user_custom_field_text, class: UserCustomField::Text do
    label { 'What is your car?' }
  end
end
