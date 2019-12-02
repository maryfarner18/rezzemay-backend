class UserSerializer
  include FastJsonapi::ObjectSerializer
  has_many :work_experiences
  has_many :projects
  has_many :skills
  has_many :educations
  has_many :addresses
  attributes :first_name, :last_name
end
