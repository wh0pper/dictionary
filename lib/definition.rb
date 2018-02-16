#!/usr/bin/ruby
require 'json'
require 'net/http'

class Definition
  def initialize(word)
    @word = word
  end

  # def get_definition
  #
  # end

  def custom_definition(input)
    @custom_definition = input
  end
end
