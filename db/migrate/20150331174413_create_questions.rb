class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.column :body, :string
      t.column :user_id, :integer
    end
  end
end
