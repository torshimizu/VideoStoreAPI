class AddDefaultToMoviesCheckedOutCount < ActiveRecord::Migration[5.1]
  def change
    change_column_default :customers, :movies_checked_out_count, 0
  end
end
