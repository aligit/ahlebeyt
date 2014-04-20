class RemoveLanguagesFromEvent < ActiveRecord::Migration
  def change
    remove_column :events, :speaking_languages, :array
  end
end
