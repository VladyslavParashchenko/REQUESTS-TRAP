class MainController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index; end

  def save_request; end

  def show_requests; end
  def show_instructions; end
end
