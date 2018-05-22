class RequestsChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'r' + params[:trap_id]
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

end
