class FruitsController < ApplicationController
    skip_before_action :verify_authenticity_token

    def index
        # render({ :json => { :message => 'hi', :status => 200 } })
        # render json: message: 'hi', status: 200 # doesn't work because nested objects are unguessable
        render json: Fruit.all
    end

    def show
        render json: Fruit.find(params[:id])
    end

    def create
        render json: Fruit.create(params[:fruit])
    end

    def delete
        render json: Fruit.delete(params[:id])
    end
end
