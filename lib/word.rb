#!/usr/bin/ruby

class Word
  attr_reader :word, :definition, :word_list
  @@word_hash = {}

  def initialize(attributes)
    @word = attributes[:word]
    @definition = attributes[:definition]
  end

  def add_to_list
    @@word_hash.store(@word, self)
  end

  def self.return_list
    @@word_hash
  end
end
