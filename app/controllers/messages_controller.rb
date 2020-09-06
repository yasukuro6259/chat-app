class MessagesController < ApplicationController
  def index
    @message = Message.new
    @room = Room.find(params[:room_id])
  end

  def create
    @room = Room.find(params[:room_id]) #createアクションで得られた情報ということ？ 上の@roomが更新されたということ？
    @message = @room.messages.new(message_params)
    @message.save
    if @message.save
      redirect_to room_messages_path(@room)
    else
      render :index
    end
  end

  private

  def message_params
    params.require(:message).permit(:content).merge(user_id: current_user.id)
  end
end
