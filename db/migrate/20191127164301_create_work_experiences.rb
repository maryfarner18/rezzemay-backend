class CreateWorkExperiences < ActiveRecord::Migration[6.0]
  def change
    create_table :work_experiences do |t|
      t.string :company
      t.string :title
      t.string :start
      t.string :end
      t.string :city
      t.string :state
      t.text :description
      t.references :user

      t.timestamps
    end
  end
end
