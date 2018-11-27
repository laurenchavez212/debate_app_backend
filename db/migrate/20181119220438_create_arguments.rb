class CreateArguments < ActiveRecord::Migration[5.2]
  def change
    create_table :arguments do |t|
      t.references :topic, foreign_key: true
      t.references :user, foreign_key: true
      t.text :content
      t.string :link
      t.boolean :stance
       t.timestamps
    end
  end
end