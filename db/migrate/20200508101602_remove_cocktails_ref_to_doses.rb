class RemoveCocktailsRefToDoses < ActiveRecord::Migration[6.0]
  def change
    remove_reference :doses, :cocktails, foreign_key: true
  end
end
