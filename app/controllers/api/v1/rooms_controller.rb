module Api
  module V1
    class RoomsController < ApplicationController
      skip_before_action :verify_authenticity_token

      def index
        @rooms = Room.order('created_at DESC')
        render json: { status: 'Success', rooms: @rooms }, status: :ok
      end
    end
  end
end
