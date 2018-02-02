class CreateReports < ActiveRecord::Migration[5.1]
  def change
    create_table :reports do |t|
      t.string :title
      t.integer :type_of
      t.string :reportable_type
      t.integer :user_id
      t.integer :reportable_id
      t.integer :status, default: 0
      t.string :status_comment
      t.text :description

      t.timestamps
    end
  end
end
