# frozen_string_literal: true

module ErrorHandler
  def self.included(clazz)
    clazz.class_eval do
      rescue_from StandardError do |e|
        respond(:standard_error, 500, e.to_s)
      end
      rescue_from ArgumentError do |e|
        respond('base', 422, e.to_s)
      end
      rescue_from ActiveRecord::RecordNotFound do |e|
        respond('base', 404, e.to_s)
      end
      rescue_from CustomError do |e|
        respond(e.error, e.status, e.message.to_s)
      end
    end
  end

  private

  def respond(error, status, message)
    json = Helpers::Render.json(error, message)
    render json: json, status: status
  end
end
