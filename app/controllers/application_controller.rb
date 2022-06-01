# frozen_string_literal: true

class ApplicationController < ActionController::API
  include RackSessionFix
  include ErrorHandler

  before_action :authenticate_user!
end
