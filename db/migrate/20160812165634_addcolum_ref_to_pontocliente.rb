class AddcolumRefToPontocliente < ActiveRecord::Migration
  def change
     add_reference :pontoclientes, :premio, index: true, foreign_key: true
  end
end
