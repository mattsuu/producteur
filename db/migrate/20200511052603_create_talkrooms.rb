class CreateTalkrooms < ActiveRecord::Migration[5.2]
  def change
    create_table :talkrooms do |t|
      t.references :receiver, foreign_key: true
      t.references :advisor, foreign_key: true
      t.timestamps null: false
    end
  end
end
