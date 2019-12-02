class User < ApplicationRecord
    has_many :work_experiences
    has_many :addresses
    has_many :educations
    has_many :projects
    has_many :skills
    has_many :websites
    
end
