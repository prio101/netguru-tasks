require 'rails_helper'

RSpec.describe MoviesController, type: :controller do

  login_user

  describe "/api/v1/movie_list" do
    let!(:movie) { FactoryBot.create(:movie) }
    let(:attributes) { FactoryBot.attributes_for(:movie) }

    context '#movie_list' do

      before(:each) do
        get :movies_list
      end

      it "should return ok status" do
        expect(response.status).to eq 200
      end

      it "should return content type json" do
        expect(response.content_type).to eq 'application/json'
      end

      it "should return a movie data" do
        expect(response.body).not_to eq({ data: attributes })
      end
    end
  end

  describe "/api/v1/movie" do
    let!(:movie) { FactoryBot.create(:movie) }
    let(:attributes) { FactoryBot.attributes_for(:movie) }

    context "#movie" do

      before(:each) do
        get :movie, params: { id: movie.id }
      end

      it "should return ok status" do
        expect(response.status).to eq 200
      end

      it "should return content type json" do
        expect(response.content_type).to eq 'application/json'
      end

      it "should return a movie data" do
        expect(response.body).not_to eq({ data: attributes })
      end
    end
  end

  describe "api/v2/movie_list" do
    let!(:movie) { FactoryBot.create(:movie) }
    let(:attributes) { FactoryBot.attributes_for(:movie) }
    context "#movies_list_with_genre" do

      before(:each) do
        get :movies_list_with_genre
      end

      it "should return ok status" do
        expect(response.status).to eq 200
      end

      it "should return content type json" do
        expect(response.content_type).to eq 'application/json'
      end

      it "should return a movie data" do
        expect(response.body).not_to eq({ data: attributes })
      end
    end
  end
end
