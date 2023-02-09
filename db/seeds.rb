User.create!(email: 'my-email@gmail.com')

UserCustomField::MultipleSelect.create(label: 'What is your hobby?', values: ['Table tennis', 'Video games', 'Walking', 'Movies'])
UserCustomField::SingleSelect.create(label: 'Where are you from?', values: ['Kyiv', 'Lviv'])
UserCustomField::Number.create(label: 'How old are you?')
UserCustomField::Text.create(label: 'What is your car?')
