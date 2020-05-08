class RemoveIngedientsRefToDoses < ActiveRecord::Migration[6.0]
  def change
    remove_reference :doses, :ingredients, foreign_key: true
  end
end
