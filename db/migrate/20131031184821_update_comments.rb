class UpdateComments < ActiveRecord::Migration
  def up
    add_column :comments, :submission_id, :integer
  end

  def down
    remove_column :comments, :submission_id
  end
end
