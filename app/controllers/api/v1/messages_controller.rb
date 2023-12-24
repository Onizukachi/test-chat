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
          @message = Message.create(room:, body:, user: guest)
          @message.broadcast_append_to @message.room, locals: { user: guest }
          render json: @message, status: :created
        end
      end

      private

      def message_params
        params.permit(:room_title, :message)
      end

      def guest
        return @guest if @guest
        Rails.cache.write('guest', User.find_by_email('guest@mail.ru'), expires_in: 2.days)

        @guest = Rails.cache.read('guest')
        @guest
      end
    end
  end
end
