class AddUserRefToCampervans < ActiveRecord::Migration[7.0]
  def change
    add_reference :campervans, :user, null: false, foreign_key: true
  end
end
