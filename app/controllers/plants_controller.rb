class PlantsController < ApplicationController

    wrap_parameters format: []

    def index
        render json: Plant.all
    end

    def show
        showPlant = Plant.find(params[:id])
        if showPlant
            render json: showPlant, status: :ok
        else
            render json: { error: "Plant not found"}, status: :not_found
        end
    end

    def create
        render json: Plant.create(plant_params), status: :created
    end

    private

    def plant_params
        params.permit :name, :image, :price 
    end
end
