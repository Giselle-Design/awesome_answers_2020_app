class AddColumnViewCountToQuestions < ActiveRecord::Migration[6.0]
  def change
    add_column :questions, :view_count, :integer #data type is integer
  end
end
