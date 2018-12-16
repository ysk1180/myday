class CreatePostYears < ActiveRecord::Migration[5.2]
  def change
    create_table :post_years do |t|
      t.string :h
      t.string :title

      t.timestamps
    end
  end
end
