module Api
  module V1
    class MessagesController < ApplicationController
      skip_before_action :verify_authenticity_token

      def create
        room = Room.find_by_title message_params['room_title']
        body = message_params['message']

        if room.blank?
          render json: { room: 'not found' }, status: :not_found
        elsif body.blank?
          render json: { message: 'cant be blank' }, status: :unprocessable_entity
        else
          guest_user = User.find_by_email('guest@mail.ru')
          @message = Message.create(room:, body:, user: guest_user)
          @message.broadcast_append_to @message.room, locals: { user: guest_user }
          render json: @message, status: :created
        end
      end

      private

      def message_params
        params.permit(:room_title, :message)
      end
    end
  end
end
