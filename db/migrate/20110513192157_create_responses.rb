class CreateResponses < ActiveRecord::Migration
  def self.up
    create_table :responses do |t|
      t.references :Evaluation
      t.datetime :responseDate
      t.references :Answer
      t.references :Question

      t.timestamps
    end
  end

  def self.down
    drop_table :responses
  end
end
