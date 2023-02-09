# frozen_string_literal: true

module API
  module V1
    class UsersController < ApplicationController
      # TODO: Move error handling to module
      rescue_from ActiveRecord::RecordNotFound, with: :not_found_error
      rescue_from ActiveRecord::RecordInvalid, with: :validation_error

      def update
        User::Update.new(user, fields: user_params[:fields]).call

        render json: UserRepresenter.new(user).to_json
      end

      private

      memoize def user
        User.find(params[:id])
      end

      def user_params
        params.require(:user).permit(fields: {})
      end

      def validation_error(e)
        # To make errors look like: {'1' => 'error message}
        errors = e.record.errors.map { |err| [err.options[:field_id], err.message] }.to_h

        render json: {status: 422, errors: errors}, status: :unprocessable_entity
      end

      def not_found_error(e)
        render json: {status: 404, errors: e.message}, status: :not_found
      end
    end
  end
end
