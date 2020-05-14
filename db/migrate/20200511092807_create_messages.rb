class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.references :talkroom, foreign_key: true
      t.boolean :is_receiver
      t.text :content
      t.string :image
      t.timestamps
    end
  end
end
