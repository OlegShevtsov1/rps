module V1
  class GamesController < ApplicationController

    def index
      # TODO: it could be described some rules, but I leave it for now
    end

    def create
      render json: data_payload(Games::PlayService.new(params[:option]).call), status: :ok
    end
  end
end
