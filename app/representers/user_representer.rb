# frozen_string_literal: true

class UserRepresenter < Representable::Decorator
  include Representable::JSON

  property :id
  # TODO: More representable fields with id, label, value
  property :fields
end
