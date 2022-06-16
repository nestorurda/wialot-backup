class AppvarChannel < ApplicationCable::Channel
  def subscribed
     stream_from "appvar_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
