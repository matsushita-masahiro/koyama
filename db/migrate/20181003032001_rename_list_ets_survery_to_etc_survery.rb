class RenameListEtsSurveryToEtcSurvery < ActiveRecord::Migration[5.2]
  def change
    rename_table :ets_surveys, :etc_surveys
  end
end
