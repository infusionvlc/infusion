# frozen_string_literal: true

class AddContributorToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :contributor, :boolean, default: false
  end
end
