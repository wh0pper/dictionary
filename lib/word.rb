#!/usr/bin/ruby

class Word
  attr_reader :word, :definition, :word_list
  @@word_list = {}

  def initialize(word)
    @word = word
    @definition = Definition.new(@word)
  end

  def add_to_list
    @@word_list.store(@word, @definition)
  end

  def self.return_list
    @@word_list
  end

  # def self.clear
  #   @@word_list = {}
  # end

end
