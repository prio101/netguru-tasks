class AddMovieRefToComments < ActiveRecord::Migration[5.2]
  def change
    add_reference :comments, :movie, index: true
  end
end
