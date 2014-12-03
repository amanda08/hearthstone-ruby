#!/usr/local/bin/ruby
require_relative './card'
require 'json'

class Deck
  attr_accessor :contents

  def initialize
    # it parses the file.
    # it generates an array of card objects
    @contents = []
    get_cards
  end

  def count
    @contents.count
  end
  
  def deal_card
    # it selects a random card and removes it from the deck
    num = rand(@contents.length - 1)
    card = @contents[num]
    @contents.delete_at(num)
    # move refactoring pattern??
    card
  end

  def get_cards
    card_library = JSON.parse(File.read("data/cards.json"))["cards"].find_all{|card| card["category"] == "minion"}
    while @contents.size < 13
      card = card_library.sample
      @contents << Card.new(card)
    end
  end

  

end