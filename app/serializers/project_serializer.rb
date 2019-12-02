class ProjectSerializer
  include FastJsonapi::ObjectSerializer
  attributes :title, :description, :link, :image
end
