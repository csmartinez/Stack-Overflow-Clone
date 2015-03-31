class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.column :body, :string
      t.column :user_id, :integer
      t.column :question_id, :integer
    end
  end
end
