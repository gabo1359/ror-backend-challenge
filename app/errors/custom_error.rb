# frozen_string_literal: true

class CustomError < StandardError
  attr_reader :error, :status, :message

  def initialize(error = nil, status = nil, message = nil)
    @error = error || 'base'
    @status = status || :unprocessable_entity
    @message = message || 'Something went wrong'
  end

  def fetch_json
    Helpers::Render.json(error, status, message)
  end
end
