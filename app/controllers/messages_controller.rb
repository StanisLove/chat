class MessagesController < ApplicationController
  before_action :require_login

  private

    def message_params
      params.require(:message).permit(:body)
    end
end
