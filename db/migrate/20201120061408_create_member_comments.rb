class CreateMemberComments < ActiveRecord::Migration[6.0]
  def change
    create_table :member_comments do |t|
      t.references :member,       foreign_key: true
      t.references :comment,      foreign_key: true
      t.timestamps
    end
  end
end
