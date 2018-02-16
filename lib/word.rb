#!/usr/bin/ruby

class Word
  attr_reader :word, :definition, :word_list
  @@word_list = []

  def initialize(attributes)
    @word = attributes[:word]
    @definition = attributes[:definition]
  end

  def add_to_list
    @@word_list.push(@word)
  end

  def self.return_list
    @@word_list
  end

  def self.sort
    @@word_list.sort!
  end
end
