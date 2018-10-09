# frozen_string_literal: true

class AddLocalizationFieldsToCategories < ActiveRecord::Migration[5.1]
  def change
    add_column :categories, :es_name, :string
    add_column :categories, :ca_name, :string
  end
end
