class CreateEvaluations < ActiveRecord::Migration
  def self.up
    create_table :evaluations do |t|
      t.references :Review
      t.references :TeamMember

      t.timestamps
    end
  end

  def self.down
    drop_table :evaluations
  end
end
