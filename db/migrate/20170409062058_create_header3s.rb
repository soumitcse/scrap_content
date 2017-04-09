class CreateHeader3s < ActiveRecord::Migration[5.0]
  def change
    create_table :header3s do |t|
      t.string :data
      t.belongs_to :welcome, foreign_key: true

      t.timestamps
    end
  end
end
