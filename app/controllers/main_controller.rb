# frozen_string_literal: true

class MainController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index; end

  def save_request
    rqst = RequestModel.new
    rqst.trap_id = params[:trap_id]
    rqst.headers = headers.to_json
    rqst.cookies = cookies.to_json
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
    else
      render 'main/request_not_save', response_code: 500
    end
  end

  def show_requests
    @requests = RequestModel.where('trap_id = ?', params[:trap_id]).order('created_at desc')
    response.set_header('TRAP_ID', params[:trap_id])
  end

  def show_instructions; end

end
