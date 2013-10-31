class CreateSubmissions < ActiveRecord::Migration
  def up
    create_table :submissions do |t|
      t.string :title
      t.string :url

      t.timestamps
    end
  end

  def down
    drop_table :submissions
  end
end
