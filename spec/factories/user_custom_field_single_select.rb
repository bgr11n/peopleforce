# frozen_string_literal: true

FactoryBot.define do
  factory :user_custom_field_single_select, class: UserCustomField::SingleSelect do
    label { 'Where are you from?' }
    values { ['Kyiv', 'Lviv'] }
  end
end
