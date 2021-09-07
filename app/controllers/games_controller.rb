# frozen_string_literal: true

# app controllers games_controller.rb
class GamesController < ApplicationController
  def new
    # display new random grid and form
    @letters = []
    alphabets = %w[A B C D E F G H I J K L M N O P Q R S T U V W X Y Z]
    10.times do
      @letters << alphabets.sample
    end
  end

  def score
    # display score
    @answer = params[:answer]

    # The word can’t be built out of the original grid
    ans_arr = @answer.upcase.split('')
    letters = params[:letters]

    def make_hash(an_array)
      item_count = {}
      an_array.each do |item|
        item_count[item] = item.count(item)
      end
      return item_count
    end

    # The word is valid according to the grid, but is not a valid English word
    # The word is valid according to the grid and is an English word

  end
end
