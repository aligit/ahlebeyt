class AddLanguagesToEvent < ActiveRecord::Migration
  def change
    add_column :events, :speaking_languages, :string, array: true, default: '{}' 
  end
end
