class CreateMemberChats < ActiveRecord::Migration[5.2]
  def change
    create_table :member_chats do |t|
      t.text :content
      t.string :image
      t.references :receiver, foreign_key: true
      t.references :advisor, foreign_key: true
      t.datetime	
      t.timestamps
    end
  end
end
