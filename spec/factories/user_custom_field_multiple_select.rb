# frozen_string_literal: true

FactoryBot.define do
  factory :user_custom_field_multiple_select, class: UserCustomField::MultipleSelect do
    label { 'You favorite game?' }
    values { ['Football', 'Basketball', 'Table tennis'] }
  end
end
