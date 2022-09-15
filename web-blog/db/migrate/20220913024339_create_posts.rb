class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :tittle
      t.text :desc
      t.text :resource

      t.timestamps
    end
  end
end
