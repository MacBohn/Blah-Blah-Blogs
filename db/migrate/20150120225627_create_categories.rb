class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :music
      t.string :sports
      t.string :tech
      t.string :politics
      t.string :food  
    end
  end
end
