class FruitsController < ApplicationController
    def index
        # render({ :json => { :message => 'hi', :status => 200 } })
        # render json: message: 'hi', status: 200 # doesn't work because nested objects are unguessable
        render json: [
            { name: 'apple', color: 'red', readyToEat: true },
            { name: 'banana', color: 'yellow', readyToEat: false },
            { name: 'pineapple', color: 'yelow', readyToEat: true }
        ]
    end
end
