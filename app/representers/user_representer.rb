# frozen_string_literal: true

class UserRepresenter < Representable::Decorator
  include Representable::JSON

  property :id
  property :fields
end
