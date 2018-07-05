class BreedsController < ApplicationController

  def index
    @breed = DogBreedFetcher.fetch
  end

  def list
    response = DogBreedList.new.call
    unless response["success"]
      redirect_to breeds_path
    end
    @breed_list  =  response["message"]
  end

  def fetch_by_breed
    response = DogByBreed.new(params[:breed_name]).call
    unless response["success"]
      redirect_to breeds_path
    end
    @image = response["message"]
  end

end
