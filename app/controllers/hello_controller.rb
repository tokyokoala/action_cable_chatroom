class HelloController < ApplicationController
  def index
    @messages = Message.all
  end
end
