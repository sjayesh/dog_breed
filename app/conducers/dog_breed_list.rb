class DogBreedList

  def call
    fetch_list
  end

  private

  def fetch_list
    begin
      response = JSON.parse(RestClient.get("https://dog.ceo/api/breeds/list/all").body)
      success_response(response["message"])
    rescue Object => e
      error_response(e)
    end
  end

  def success_response(list)
    {
      "success"  => true,
      "message" => list
    }
  end


  def error_response(e)
    {
      "success"  => false,
      "message" => e.message
    }
  end
end
