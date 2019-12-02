class User < ApplicationRecord
    has_many :work_experiences
    has_many :addresses
    has_many :educations
    has_many :projects
    has_many :skills
    has_many :websites

    def user_obj 
        {
            'user': {
                'id': self.id,
                'username': self.username,
                'first_name': self.first_name,
                'last_name': self.last_name,
                'phone': self.phone,
                'email': self.email
            },
            'work_experiences': self.work_experiences.map do |work_exp|
                {
                    'company': work_exp.company,
                    'title': work_exp.title,
                    'start': work_exp.start,
                    'end': work_exp.end,
                    'city': work_exp.city,
                    'state': work_exp.state,
                    'description': work_exp.description
                    
                }
            end,
            'skills': self.skills.map do |skill|
                {
                    'name': skill.name,
                    'proficiency': skill.proficiency
                }
            end,
            'education': self.educations.map do |edu|
                {
                    'university': edu.university,
                    'degree': edu.degree,
                    'concentration': edu.concentration,
                    'start': edu.start,
                    'end': edu.end
                }
            end,
            'projects': self.projects.map do |proj|
                {
                    'title': proj.title,
                    'description': proj.description,
                    'link': proj.link,
                    'image': proj.image
                }
            end,
            'websites': self.websites.map do |web|
                {
                    'link': web.link,
                    'icon': web.icon,
                    'site': web.site
                }
            end,
            'addresses': self.addresses.map do |add|
                {
                    'street1': add.street1,
                    'street2': add.street2,
                    'city': add.city,
                    'state': add.state,
                    'zip': add.zip,
                    'country': add.country
                }
            end
        }
    end
end
