# frozen_string_literal: true

class AddBioToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :bio, :text, default: ''
  end
end
