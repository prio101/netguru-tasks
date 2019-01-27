module Resources
  class MovieResource
    attr_reader :titles, :base_uri, :hash

    def initialize(titles)
      @base_uri = 'https://pairguru-api.herokuapp.com/api/v1/movies/'
      @titles = titles
      @hash = {}
    end

    def movie_list_response
      call_api
      hash
    end

    def movie_response
      call_api
      hash
    end

    def call_api
      titles.each do |title|
        escaped_uri = URI.escape [@base_uri, title].join
        uri = URI.parse(escaped_uri)
        res = Net::HTTP.get uri
        json = JSON.parse res
        hash.store(json["data"]["attributes"]["title"].split.join('-'), json["data"])
      end
    end

  end
end
