class EducationSerializer
  include FastJsonapi::ObjectSerializer
  attributes :university, :degree, :concentration, :start, :end
end
