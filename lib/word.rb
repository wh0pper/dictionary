#!/usr/bin/ruby

class Word
  attr_reader :word, :definition
  @@word_list = {}

  def initialize(attributes)
    @word = attributes[:word]
    @definition = attributes[:definition]
  end

  def add_to_list
    @@word_list.store('@word', self)
  end
end
