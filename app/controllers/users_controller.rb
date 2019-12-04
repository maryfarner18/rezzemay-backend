class UsersController < ApplicationController

    def show
        user = User.find_by(user_slug: params[:id])
        render json: {
            status: 200,
            data: user.user_obj
        }
    end

    def create

        # Create user
        user = User.new(user_create_params[:user])
        
        if user.valid?
            user.save
            # associate form data with user
            user.addresses.create(addresses_params[:addresses])
            user.educations.create(educations_params[:educations])
            user.work_experiences.create(work_experiences_params[:work_experiences])
            user.skills.create(skills_params[:skills])
            user.websites.create(websites_params[:websites])
            user.projects.create(projects_params[:projects])
            
            # login
            
            # send data
            render json: {
                status: 201,
                data: user.user_obj
            }
        else
            render json: error_json(user)
        end

    end

    def files
        byebug
        user = User.find(params[:id])

        
    end

    def update

        user = User.find(params[:id])
        puts "user updating"
        user.update(user_create_params[:user])
        puts 'addresses about to update'
        user.addresses.each_with_index do |addr, idx|
            addr.update(addresses_params[:addresses][idx])
        end
        # user.addresses.update_all(addresses_params[:addresses])
        puts 'addresses updated'
        user.educations.each_with_index do |addr, idx|
            addr.update(educations_params[:educations][idx])
        end
        # user.educations.update(educations_params[:educations])
        user.work_experiences.each_with_index do |addr, idx|
            addr.update(work_experiences_params[:work_experiences][idx])
        end
        # user.work_experiences.update(work_experiences_params[:work_experiences])
        user.skills.each_with_index do |addr, idx|
            addr.update(skills_params[:skills][idx])
        end
        # user.skills.update(skills_params[:skills])
        user.websites.each_with_index do |addr, idx|
            addr.update(websites_params[:websites][idx])
        end
        # user.websites.update(websites_params[:websites])
        user.projects.each_with_index do |addr, idx|
            addr.update(projects_params[:projects][idx])
        end
        # user.projects.update(projects_params[:projects])
        if user.valid?
            user.save
            render json: {
                status: 202,
                data: user.user_obj
            }
        else
            render json: error_json(user)
        end
    end    

    def destroy
        #Probably need to destroy all of this user's info too?
        User.destroy(params[:id])
        render json: {
            status: 200
        }
    end

    private

    def user_create_params
        params.permit(
            user: [
                :user_slug, :first_name, :last_name, :phone, :email, :password, :id
            ]
        )
    end

    def user_update_params
        params.permit(
            user: [:user_slug, :first_name, :last_name, :phone, :email, :password, :id],
            addresses: [:street1, :street2, :city, :state, :zip, :country, :id],
            educations: [:university, :degree, :concentration, :start, :end, :id],
            work_experiences: [:company, :title, :start, :end, :city, :state, :description, :id],
            skills: [:name, :proficiency, :id],
            websites: [:link, :id],
            projects: [:title, :description, :link, :image, :id]
        )
    end

    def addresses_params
        params.permit(
            addresses: [:street1, :street2, :city, :state, :zip, :country, :id]
        )
    end

    def educations_params
        params.permit(
            educations: [:university, :degree, :concentration, :start, :end, :id]
        )
    end

    def work_experiences_params
        params.permit(
            work_experiences: [:company, :title, :start, :end, :city, :state, :description, :id]
        )
    end

    def skills_params
        params.permit(
            skills: [:name, :proficiency, :id]
        )
    end

    def websites_params
        params.permit(
            websites: [:link]
        )
    end

    def projects_params
        params.permit(
            projects: [:title, :description, :link, :image, :id]
        )
    end

    def error_json(user)
        { errors: user.errors.full_messages }
    end
    
    # def unslug(slug)
    #     slug.split('-').join('')
    # end

end