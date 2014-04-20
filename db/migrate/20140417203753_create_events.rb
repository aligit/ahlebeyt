class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.text :body
      t.datetime :startdate
      t.datetime :enddate
      t.string :location
      t.string :speaking_languages, :array => true

      t.timestamps
    end
  end
end
