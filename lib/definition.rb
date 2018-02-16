#!/usr/bin/ruby
require 'json'
require 'net/http'
%w(rubygems wordnik).each {|lib| require lib}

Wordnik.configure do |config|
	config.api_key = 'cf32ee91750f8ad549b070f2676059925994a07525c9921a6'
end

class Definition
  attr_reader :word

  def initialize(word)
    @word = word
  end

  def get_definition
    api_return = Wordnik.word.get_definitions('test', :limit => 1)
  end

  def custom_definition(input)
    @custom_definition = input
  end
end
