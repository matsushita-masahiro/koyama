class AddSurveyToMenu < ActiveRecord::Migration[5.2]
  def change
    add_column :cooking_surveys, :menu, :string
  end
end
