class CreateMembers < ActiveRecord::Migration[6.0]
  def change
    create_table :members do |t|
      t.string :name,           null: false
      t.string :nation,         null: false
      t.date   :ord,            null: false
      t.string :position,       null: false
      t.string :zone,           null: false
      t.string :height,         null: false
      t.string :weight,         null: false
      t.string :foot,           null: false
      t.string :backnumber,     null: false
      t.string :image,          null: false
      t.timestamps
    end
  end
end
