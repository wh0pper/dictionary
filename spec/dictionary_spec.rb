require('rspec')
require('pry')
require('word')
require('definition')

describe('Word') do
  test_word = Word.new('test')

  describe('#initialize') do
    it("takes hash of properties as argument and instantiates a new word") do
      expect(test_word.word).to(eq('test'))
      expect(test_word.definition.is_a?(Definition)).to(eq(true))
    end
  end

  describe('#add_to_list & #self.return_list') do
    it("adds instance to a class hash containing all words") do
      test_word.add_to_list
      list = Word.return_list
      expect(list.has_key?('test')).to(eq(true))
    end
  end
end

describe('Definition') do
  test_definition = Definition.new('test')
  describe('#initialize') do
    it('stores the word to define in an instance variable') do
      expect(test_definition.word).to(eq('test'))
    end
  end

  describe('#api_return') do
    it('uses wordnik to get dictionary definition of word') do
      expect(test_definition.api_return.is_a?(Array)).to(eq(true))
    end
  end

  describe('#parse_definition') do
    it('parses wordnik return to isolate word definition string') do
      expect(test_definition.parse_definition).to(eq("A procedure for critical evaluation; a means of determining the presence, quality, or truth of something; a trial:  a test of one's eyesight; subjecting a hypothesis to a test; a test of an athlete's endurance. "))
    end
  end

  describe('#parse_pos') do
    it('parses wordnik return to isolate word part of speech') do
      test_definition.api_return
      expect(test_definition.parse_pos).to(eq('noun'))
    end
  end

  describe('#api_synonyms') do
    it('gets synonyms from wordnik and puts them in a string separated by commas') do
      expect(test_definition.api_synonyms).to(eq('judgment, distinction, examination, discrimination, examine, standard, assay, proof, touchstone, witness'))
    end
  end
end
