class MessagesController < ApplicationController
  def index
    @message = Message.new
    @room = Room.find(params[:room_id]) 
    @messages = @room.messages.includes(:user) #@room内でされたチャット内容(messages)を全て習得、includesmメソッドにてN+1問題を解決
                      #1対多の関係であるからmessages(複数形)にしている(roomからみてmessageは1対多)
  end

  def create
    @room = Room.find(params[:room_id]) #createアクションで得られた情報ということ？ 上の@roomが更新されたということ？
    @message = @room.messages.new(message_params)
    @message.save
    if @message.save
      redirect_to room_messages_path(@room)
    else
      @messages = @room.messages.includes(:user)
      render :index
    end
  end

  private

  def message_params
    params.require(:message).permit(:content, :image).merge(user_id: current_user.id) #imageカラムは裏で動いているテーブルのカラム？
  end
end
