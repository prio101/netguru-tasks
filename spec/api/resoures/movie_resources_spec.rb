require 'rails_helper'

RSpec.describe Resources::MovieResource do

  describe "call" do
    let(:movie) { FactoryBot.create(:movie, title: 'Deadpool') }

    it "should return title" do
      expect(Resources::MovieResource.new([movie.title]).call_api).to eq [movie.title]
    end
  end

  describe "movie_list_response" do
    let(:movie) { FactoryBot.create(:movie, title: 'Godfather') }
    let(:response) do
      {"Godfather"=>
           {
               "id"=>"6",
               "type"=>"movie",
               "attributes"=>
                   {
                       "title"=>"Godfather",
                       "plot"=>"The aging patriarch of an organized crime dynasty transfers control of his clandestine empire to his reluctant son.",
                       "rating"=>9.2,
                       "poster"=>"/godfather.jpg"
                   }
           }
      }.to_json
    end

    it "should return data response" do
      expect(Resources::MovieResource.new([movie.title])
       .movie_list_response.to_json).to eq response
    end
  end

  describe "movie_response" do
    let(:movie) { FactoryBot.create(:movie, title: 'Godfather') }
    let(:response) do
      {"Godfather"=>
           {
               "id"=>"6",
               "type"=>"movie",
               "attributes"=>
                   {
                       "title"=>"Godfather",
                       "plot"=>"The aging patriarch of an organized crime dynasty transfers control of his clandestine empire to his reluctant son.",
                       "rating"=>9.2,
                       "poster"=>"/godfather.jpg"
                   }
           }
      }.to_json
    end

    it "should return data response" do
      expect(Resources::MovieResource.new([movie.title])
                 .movie_response.to_json).to eq response
    end
  end
end
