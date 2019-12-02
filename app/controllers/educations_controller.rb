class EducationsController < ApplicationController

    def update
        edu = Education.find(params[id])
        
    end

    def create
    end
end

