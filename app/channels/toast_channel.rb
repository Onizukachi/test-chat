class ToastChannel < ApplicationCable::Channel
  def subscribed
    stream_from "toasts"
  end
end
