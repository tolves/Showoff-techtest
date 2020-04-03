class CreateWidgets < ActiveRecord::Migration[6.0]
  def change
    create_table :widgets do |t|

      t.timestamps
    end
  end
end
