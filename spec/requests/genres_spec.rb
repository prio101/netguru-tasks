require "rails_helper"

describe "Genres requests", type: :request do
  let!(:genre) { FactoryBot.create(:genre) }
  let!(:movie) { FactoryBot.create(:movie, genre_id: genre.id)}
  describe "genre list" do
    it "displays only related movies" do
      visit "/genres/" + genre.id.to_s + "/movies"
      expect(page).to have_selector("table tr", count: 1)
    end
  end
end
