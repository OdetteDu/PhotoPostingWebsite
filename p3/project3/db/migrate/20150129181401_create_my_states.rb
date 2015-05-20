class CreateMyStates < ActiveRecord::Migration
  def change
    create_table :my_states do |t|

      t.timestamps
    end
  end
end
