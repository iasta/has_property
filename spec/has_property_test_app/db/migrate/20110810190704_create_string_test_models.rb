class CreateStringTestModels < ActiveRecord::Migration
  def self.up
    create_table :string_test_models do |t|
      t.string :value

      t.timestamps
    end
  end

  def self.down
    drop_table :string_test_models
  end
end
