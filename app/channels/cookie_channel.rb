class CookieChannel < ApplicationCable::Channel
  def subscribed
    stream_from "cookie_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
