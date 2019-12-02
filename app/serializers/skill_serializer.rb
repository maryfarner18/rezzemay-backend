class SkillSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :proficiency
end
