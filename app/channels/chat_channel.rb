class ChatChannel < ApplicationCable::Channel
  def subscribed
    stream_from "ruby_channel"
  end

  def unsubscribed
  end

  def speak(data)
    content = data["message"]
    # 1. 存到 Message Model
    Message.create(content: content)

    # 2. 廣播
    ActionCable.server.broadcast 'ruby_channel', message: content
  end
end

