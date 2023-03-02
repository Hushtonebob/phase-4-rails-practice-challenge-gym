class GymsController < ApplicationController

    def index
        gyms = Gym.all
        render json: gyms
    end

    def show
        gym = Gym.find_by(id: params[:id])
        render json: gym
    end

    def create
        gym = Gym.create(name: params[:name], address: params[:address])
        render json: gym, status: :created
    end

    def destroy
        gym = Gym.find_by(id: params[:id])
        if gym
          gym.destroy
          head :no_content
        else
          render json: { error: "Gym not found" }, status: :not_found
        end
      end

end
