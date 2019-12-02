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

        user = User.new(user_create_params)
        if user.valid?
            user.save
            render json: user.user_obj
        else
            render json: error_json(user)
        end

        # user.profile_image.attach(params.require(:profile_image))
        # user.resume.attach(params.require(:resume))
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

    def user_create_params
        params.require(:user).permit(
            :username,
            :first_name,
            :last_name,
            :phone,
            :email,
            :password,
            :profile_image,
            :resume,
            addresses: [:street1, :street2, :city, :state, :zip, :country],
            educations: [:university, :degree, :concentration, :start, :end],
            work_experiences: [:company, :title, :start, :end, :city, :state, :description],
            skills: [:name, :proficiency],
            websites: [:link, :icon, :site],
            projects: [:title, :description, :link, :image]
            )
    end

    def error_json(user)
        { errors: user.errors.full_messages }
    end
    
    def unslug(slug)
        slug.split('-').join('')
    end

end