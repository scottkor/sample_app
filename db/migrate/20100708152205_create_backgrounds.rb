class CreateBackgrounds < ActiveRecord::Migration
  def self.up
    create_table :backgrounds do |t|
      t.string :current_school
      t.string :schools_attended
      t.string :major
      t.text :short_bio
      t.string :superpower
      t.string :website
      t.string :interests

      t.timestamps
    end
  end

  def self.down
    drop_table :backgrounds
  end
end
