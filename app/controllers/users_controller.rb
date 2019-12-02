class UsersController < ApplicationController

    # def index
    #     users = User.all
    #     render json: UserSerializer.new(users)
    # end

    # def show
    #     user = User.find(params[:id])
    #     options = {
    #         include: [:work_experiences, :skills, :projects, :addresses, :educations]
    #     }
    #     render json: UserSerializer.new(user, options)
    # end

    def slug
        user = User.find_by(username: unslug(params[:slug]))
        render json: user.user_obj
    end

    def create
        puts("In create")
        puts(params)
    end

    def update
        user = User.find(params[:id])
        puts("In update")
        puts(params)
    end    

    def destroy
        #Probably need to destroy all of this user's info too?
        User.destory(params[id])
    end

    private

    def unslug(slug)
        slug.split('-').join('')
    end

end
