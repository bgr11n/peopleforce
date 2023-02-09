# frozen_string_literal: true

module RSpec
  module Matchers
    class ChangeReloaded < BuiltIn::Change
      private

      def initialize(receiver = nil, message = nil, &block)
        @change_details = ChangeReloadDetails.new(matcher_name, receiver, message, &block)
      end
    end

    class ChangeReloadDetails < BuiltIn::ChangeDetails
      def initialize(matcher_name, receiver = nil, message = nil, &block)
        super
        return unless receiver || message
        @value_proc = -> { receiver.reload.__send__(message) }
      end
    end

    # This matcher extends RSpecs `change` matcher to support model
    # reloading before checking if some attribute have changed.
    #
    # Without this matcher:
    #
    # ```ruby
    # expect { some_code }.to change { invoice.reload.amount }
    # ```
    #
    # With this matcher:
    #
    # ```ruby
    # expect { some_code }.to change_reloaded(invoice, :amount)
    # ```
    #
    def change_reloaded(receiver = nil, message = nil)
      ChangeReloaded.new(receiver, message)
    end
  end
end
