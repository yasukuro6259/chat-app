class RoomsController < ApplicationController

  def index
  end
  
  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    room = Room.find(params[:id]) #Roomモデルからリクエストで送られてきたid番号に該当するレコードをroomに代入
    room.destroy #上記で得られたレコードを削除
    redirect_to root_path
  end

  private

  def room_params
    params.require(:room).permit(:name, user_ids:[])
  end
end
