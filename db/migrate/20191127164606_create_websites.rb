class CreateWebsites < ActiveRecord::Migration[6.0]
  def change
    create_table :websites do |t|
      t.string :link
      t.string :icon
      t.string :site
      t.user :references

      t.timestamps
    end
  end
end
