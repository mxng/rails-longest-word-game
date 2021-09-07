# frozen_string_literal: true

require 'json'
require 'open-uri'

# app controllers games_controller.rb
class GamesController < ApplicationController
  def new
    # display new random grid and form
    @letters = []
    alphabets = %w[A B C D E F G H I J K L M N O P Q R S T U V W X Y Z]
    10.times { @letters << alphabets.sample }
  end

  def score
    # display score
    answer = params[:answer].upcase
    letters = params[:letters]

    # The word is valid according to the grid and is an English word
    @score = "Congratulations! #{answer} is a valid English word!"

    # The word can’t be built out of the original grid
    answer_arr = answer.chars
    letters_arr = letters.chars
    all_answer_in_letters = answer_arr.all? { |character| answer_arr.count(character) <= letters_arr.count(character) }
    @score = "Sorry but #{answer} can't be built out of #{letters}" unless all_answer_in_letters

    # The word is valid according to the grid, but is not a valid English word
    url = "https://wagon-dictionary.herokuapp.com/#{answer}"
    wagon_dict_serialized = URI.open(url).read
    wagon_dict = JSON.parse(wagon_dict_serialized)
    @score = "Sorry but #{answer} does not seem to be a valid English word..." unless wagon_dict['found']
  end
end
