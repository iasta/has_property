class CreateHasPropertyTestModels < ActiveRecord::Migration
  def self.up
    create_table :has_property_test_models do |t|
      t.string :value

      t.timestamps
    end
  end

  def self.down
    drop_table :has_property_test_models
  end
end

