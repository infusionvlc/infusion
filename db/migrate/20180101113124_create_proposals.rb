class CreateProposals < ActiveRecord::Migration[5.1]
  def change
    create_table :proposals do |t|
      t.references :user, foreign_key: true
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
