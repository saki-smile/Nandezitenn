class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.integer :user_id
      t.integer :category_id
      t.string :title
      t.string :image_id
      t.text :observation
      t.text :impression
      t.text :realization
      t.text :uncertainty

      t.timestamps
    end
  end
end
