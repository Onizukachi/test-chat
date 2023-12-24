class RoomsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create]

  def index
    @rooms = Room.all
  end

  def new
    @room = Room.new
  end

  def create
    @room = current_user.rooms.build(room_params)

    if @room.save
      respond_to do |format|
        format.html { redirect_to rooms_path, flash[:success] = "Room was successfully created." }
        format.turbo_stream { flash.now[:success] = "Room was successfully created." }
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @room = Room.find_by!(title: params[:title])
    @messages = @room.messages
    @new_message = current_user&.messages&.build
  end

  private

  def room_params
    params.require(:room).permit(:title)
  end
end
