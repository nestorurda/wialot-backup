class ScreenChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    stream_from "screen_channel_#{params[:screen_id]}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
