class MessagesController < ApplicationController
  def create
    @message = Message.new(message_params)
    @user = User.find_by(id: current_user.id)
    if @message.save
      ActionCable.server.broadcast 'message_channel', content: @message, user: @user
    end
  end

  private
  def message_params
    params.require(:message).permit(:content).merge(user_id: current_user.id, room_id: params[:room_id])
  end
end
