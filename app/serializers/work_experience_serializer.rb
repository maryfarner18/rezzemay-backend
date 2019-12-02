class WorkExperienceSerializer
  include FastJsonapi::ObjectSerializer
  attributes :company, :title, :start, :end, :city, :state, :description
end
