class CreateAggregates < ActiveRecord::Migration[6.1]
  def change
    create_table :aggregates do |t|
      t.string :name

      t.timestamps
    end
  end
end
