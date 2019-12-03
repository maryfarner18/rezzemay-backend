class UsersController < ApplicationController

    def show
        user = User.find_by(username: unslug(params[:id]))
        render json: user.user_obj
    end

    def create
        byebug

        user = User.create(user_create_params[:user])

        user.addresses.create(addresses_params)
        user.educations.create(educations_params)
        user.work_experiences.create(work_experiences_params)
        user.skills.create(skills_params)
        user.websites.create(websites_params)
        user.projects.create(projects_params)

        if user.valid?
            user.save
            render json: user.user_obj
        else
            render json: error_json(user)
        end
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
        params.permit(
            user: [
                :username,
                :first_name,
                :last_name,
                :phone,
                :email,
                :password,
                :profile_image,
                :resume,
            ],
            addresses: [:street1, :street2, :city, :state, :zip, :country],
            educations: [:university, :degree, :concentration, :start, :end],
            work_experiences: [:company, :title, :start, :end, :city, :state, :description],
            skills: [:name, :proficiency],
            websites: [:link],
            projects: [:title, :description, :link, :image]
            )
    end

    def addresses_params
        user_create_params[:addresses]
    end

    def educations_params
        user_create_params[:educations]
    end

    def work_experiences_params
        user_create_params[:work_experiences]
    end

    def skills_params
        user_create_params[:skills]
    end

    def websites_params
        user_create_params[:websites]
    end

    def projects_params
        user_create_params[:projects]
    end

    def error_json(user)
        { errors: user.errors.full_messages }
    end
    
    def unslug(slug)
        slug.split('-').join('')
    end

end