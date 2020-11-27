class CreateEvaluations < ActiveRecord::Migration[6.0]
  def change
    create_table :evaluations do |t|
      t.integer :total_id,       null: false
      t.integer :offence_id,     null: false
      t.integer :deffence_id,    null: false
      t.integer :pass_id,        null: false
      t.integer :dribble_id,     null: false
      t.integer :physical_id,    null: false
      t.integer :pace_id,        null: false
      t.references :member,      foreign_key: true
      t.references :user,        foreign_key: true
      t.timestamps
    end
  end
end
