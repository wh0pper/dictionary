# !/usr/bin/ruby
require 'json'
require 'net/http'
%w(rubygems wordnik).each {|lib| require lib}

Wordnik.configure do |config|
	config.api_key = 'cf32ee91750f8ad549b070f2676059925994a07525c9921a6'
end

class Definition
  attr_reader :word, :custom_definitions

  def initialize(word)
    @word = word
    @custom_definitions = []
  end

	def api_return
		@api_return = Wordnik.word.get_definitions(word, :limit => 1)
	end

  def parse_definition
    return1 = @api_return[0]
    definition1 = return1['text']
  end

  def parse_pos
    return1 = @api_return[0]
    part_of_speech = return1['partOfSpeech']
  end

  def custom_definition(input)
    @custom_definitions.push(input)
  end
end
