class CreatePostRadars < ActiveRecord::Migration[5.2]
  def change
    create_table :post_radars do |t|
      t.string :h
      t.string :title

      t.timestamps
    end
  end
end
