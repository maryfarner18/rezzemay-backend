class CreateEducations < ActiveRecord::Migration[6.0]
  def change
    create_table :educations do |t|
      t.string :university
      t.string :degree
      t.string :concentration
      t.string :start
      t.string :end
      t.references :user

      t.timestamps
    end
  end
end
