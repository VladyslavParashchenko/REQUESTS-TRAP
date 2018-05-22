# frozen_string_literal: true

class MainController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index; end

  def save_request
    rqst = RequestModel.new
    rqst.trap_id = params[:trap_id]
    rqst.headers = headers_in_json
    rqst.cookies = cookies_in_json
    rqst.request_date = Time.now
    rqst.request_method = request.scheme
    rqst.query_string = request.env[:request_uri]
    rqst.remote_ip = request.ip
    rqst.query_string = request.original_fullpath
    rqst.request_method = request.request_method
    rqst.scheme_request = request.scheme
    rqst.query_params = params.to_json
    if rqst.save
      rendered_row = render_to_string'_table_row', locals: {app_request:rqst}, layout:false
      ActionCable.server.broadcast('r'+params[:trap_id], rendered_row)
    end
  end

  def show_requests
    @requests = RequestModel.where('trap_id = ?', params[:trap_id]).order('request_date desc')
    response.set_header('TRAP_ID', params[:trap_id])
  end

  def show_instructions; end

  private

  def data_to_json(data)
    hash = {}
    data.each do |key, value|
      hash[key] = value
    end
    hash
  end

  def headers_in_json
    data_to_json(headers).to_json
  end

  def cookies_in_json
    data_to_json(cookies).to_json
  end
end
