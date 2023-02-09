# frozen_string_literal: true

# TODO: Consider using lib for business logic (ex. traiblazer-operation)
#
# Responsible for updating provided user record
#
class User::Update
  attr_reader :user, :fields

  def initialize(user, fields: [])
    @user = user
    @fields = fields
  end

  def call
    fields.each do |id, value|
      user.fields[id.to_s] = value
    end
    user.save!
  end
end
