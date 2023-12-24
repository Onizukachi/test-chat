class RoomsController < ApplicationController
  def index
    @rooms = Room.all
  end

  def new
    @room = Room.new
  end

  def create
    @room = current_user&.rooms&.build(room_params)

    if @room&.save
      respond_to do |format|
        format.html { redirect_to rooms_path, notice: "Room was successfully created." }
        format.turbo_stream
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
