class FruitsController < ApplicationController
    def index
        # render({ :json => { :message => 'hi', :status => 200 } })
        # render json: message: 'hi', status: 200 # doesn't work because nested objects are unguessable
        render json: Fruit.all
    end

    def show
        render json: Fruit.find(params[:id])
    end
end
