class DogByBreed

  def initialize(name)
    @name = name
  end

  def call
    fetch_by_bread(@name)
  end

  private

  def fetch_by_bread(name)
    begin
      response = JSON.parse(RestClient.get("https://dog.ceo/api/breed/#{name}/images").body)
      success_response(response["message"].sample)
    rescue Object => e
      error_response(e)
    end
  end

  def success_response(image_url)
    {
      "success"  => true,
      "message" => image_url
    }
  end

  def error_response(e)
    {
      "success"  => false,
      "message" => e.message
    }
  end
end
