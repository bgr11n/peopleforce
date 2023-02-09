# frozen_string_literal: true

RSpec.describe 'PATCH /api/v1/users/:id', type: :request do
  subject(:resp) do
    patch(
      "/api/v1/users/#{user_id}",
      params: {user: {fields: fields}},
      as: :json
    )
    response
  end

  let(:user) { create(:user) }
  let(:user_id) { user.id }
  let(:fields) { {} }
  let(:number_field) { create(:user_custom_field_number) }
  let(:text_field) { create(:user_custom_field_text) }
  let(:single_select_field) { create(:user_custom_field_single_select) }
  let(:multiple_select_field) { create(:user_custom_field_multiple_select) }

  context 'when user dont exist' do
    let(:user_id) { 1233 }

    it { is_expected.to be_not_found}
  end

  context 'when user exists' do
    it { is_expected.to be_ok}
    its_block { is_expected.not_to change(user.reload, :fields) }

    context 'when text field passed' do
      let(:fields) { {text_field.id => 'new value'} }

      its_block { is_expected.to change_reloaded(user, :fields).to(hash_including(text_field.id.to_s => 'new value')) }
    end

    context 'when number field passed' do
      let(:fields) { {number_field.id => value} }

      context 'when valid data passed' do
        let(:value) { 123 }

        its_block { is_expected.to change_reloaded(user, :fields).to(hash_including(number_field.id.to_s => 123)) }
      end

      context 'when invalid data passed' do
        let(:value) { 'some string' }

        it { is_expected.to be_unprocessable }
        its(:body) { is_expected.to be_json('status' => 422, 'errors' => hash_including(number_field.id.to_s => 'is not a number')) }
      end
    end

    context 'when single select field passed' do
      let(:fields) { {single_select_field.id => value} }

      context 'when valid data passed' do
        let(:value) { single_select_field.values.last }

        its_block { is_expected.to change_reloaded(user, :fields).to(hash_including(single_select_field.id.to_s => value)) }
      end

      context 'when invalid data passed' do
        context 'when array is passed' do
          let(:value) { [single_select_field.values.last] }

          its(:body) { is_expected.to be_json('status' => 422, 'errors' => hash_including(single_select_field.id.to_s => 'array not supported')) }
        end

        context 'when value not from list' do
          let(:value) { 'Random' }

          its(:body) {
            is_expected.to be_json('status' => 422, 'errors' => hash_including(single_select_field.id.to_s => 'is not included in the list'))
          }
        end
      end
    end

    context 'when multiple select field passed' do
      let(:fields) { {multiple_select_field.id => value} }

      context 'when valid data passed' do
        let(:value) { [multiple_select_field.values.last] }

        its_block { is_expected.to change_reloaded(user, :fields).to(hash_including(multiple_select_field.id.to_s => value)) }
      end

      context 'when invalid data passed' do
        context 'when not array passed' do
          let(:value) { multiple_select_field.values.last }

          its(:body) { is_expected.to be_json('status' => 422, 'errors' => hash_including(multiple_select_field.id.to_s => 'not array')) }
        end

        context 'when value not from list' do
          let(:value) { ['Random'] }

          its(:body) {
            is_expected.to be_json('status' => 422, 'errors' => hash_including(multiple_select_field.id.to_s => 'is not included in the list'))
          }
        end
      end
    end
  end
end
