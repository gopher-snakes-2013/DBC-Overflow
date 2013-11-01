class CreateVotes < ActiveRecord::Migration
  def up
    create_table :votes do |t|
      t.integer :direction
      t.belongs_to :submission
      t.timestamps
    end
  end

  def down
    drop_table :votes
  end
end
