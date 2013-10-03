class CreateSubmissions < ActiveRecord::Migration
  def change
    create_table :submissions do |t|
      t.string :name
      t.string :email
      t.string :size
      t.integer :dueDay
      t.integer :dueMonth
      t.integer :dueYear
      t.string :gName
      t.string :gRelationship
      t.string :gEmail

      t.timestamps
    end
  end
end
