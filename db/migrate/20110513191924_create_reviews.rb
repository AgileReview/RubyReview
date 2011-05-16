class CreateReviews < ActiveRecord::Migration
  def self.up
    create_table :reviews do |t|
      t.datetime :dueDate
      t.references :TeamMember

      t.timestamps
    end
  end

  def self.down
    drop_table :reviews
  end
end
