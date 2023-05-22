require "json"
require "open-uri"

class GamesController < ApplicationController

  def new
    @letters = (0...10).map { ('a'..'z').to_a[rand(26)] }
  end

  def score
    @word = params[:word]
    @url = "https://wagon-dictionary.herokuapp.com/#{@word}"
    english_validation = URI.open(@url).read
    @validEndlish = JSON.parse(english_validation)["found"]

    wordArr = @word.split("")

    @response = ""
    exists =[]
    wordArr.each do |wordSingle|
      if params[:letters].include? wordSingle
        exists.push(true)
      end
    end

    if exists.all? && @validEndlish == true
      @response = "Congratulations! #{@word} is a winner!"
    else
      @response = "Sorry, #{@word} is no bueno"
    end
    # raise


    # puts @url.found


    # @collected_input = params[:collected_input]
    # @token = params[:token]
    # @tags_list = params[:tags_list]

    # raise
  end
end
