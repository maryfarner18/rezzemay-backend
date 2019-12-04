class UsersController < ApplicationController

    def show
        user = User.find_by(user_slug: params[:id])
        render json: user.user_obj
    end

    def create

        # Create user

        # associate form data with user

        @user = User.create(user_create_params)
        
        if @user.valid?
            @user.save
            login!
            @user.addresses.create(addresses_params)
            @user.educations.create(educations_params)
            @user.work_experiences.create(work_experiences_params)
            @user.skills.create(skills_params)
            @user.websites.create(websites_params)
            @user.projects.create(projects_params)
            render json: @user.user_obj
        else
            render json: error_json(@user)
        end
    end

    def update
        byebug
        user = User.find(params[:id])

        user.update(user_create_params)

        if user.valid?
            user.save
            render json: user.user_obj
        else
            render json: error_json(user)
        end
    end    

    def destroy
        #Probably need to destroy all of this user's info too?
        User.destory(params[:id])
    end

    private

    def user_create_params
        params.permit(
            user: [
                :username, :first_name, :last_name, :phone, :email, :password
            ]
        )
    end

    def addresses_params
        params.permit(
            addresses: [:street1, :street2, :city, :state, :zip, :country]
        )
    end

    def educations_params
        params.permit(
            educations: [:university, :degree, :concentration, :start, :end]
        )
    end

    def work_experiences_params
        params.permit(
            work_experiences: [:company, :title, :start, :end, :city, :state, :description]
        )
    end

    def skills_params
        params.permit(
            skills: [:name, :proficiency]
        )
    end

    def websites_params
        params.permit(
            websites: [:link]
        )
    end

    def projects_params
        params.permit(
            projects: [:title, :description, :link, :image]
        )
    end

    def error_json(user)
        { errors: user.errors.full_messages }
    end
    
    # def unslug(slug)
    #     slug.split('-').join('')
    # end

end