require('rspec')
require('pry')
require('word')
require('definition')

describe('Word') do
  test_attributes = { :word => 'test', :definition => 'test definition' }
  test_word = Word.new(test_attributes)

  describe('#initialize') do
    it("takes hash of properties as argument and instantiates a new word") do
      expect(test_word.word).to(eq('test'))
      expect(test_word.definition).to(eq('test definition'))
    end

    describe('#add_to_list & #self.return_list') do
      it("adds instance to a class hash containing all words") do
        test_word.add_to_list
        expect(Word.return_list).to(eq({'test' => test_word}))
      end
    end
  end
end

describe('Definition') do
  test_definition = Definition.new('test')
  api_return = test_definition.api_definition
  describe('#initialize') do
    it('stores the word to define in an instance variable') do
      expect(test_definition.word).to(eq('test'))
    end
  end

  describe('#get_definition') do
    it('uses wordnik to get dictionary definition of word') do
      expect(api_return.is_a?(Array)).to(eq(true))
    end
  end

  describe('#parse_definition') do
    it('parses wordnik return to isolate word definition string') do
      expect(test_definition.parse_definition).to(eq("A procedure for critical evaluation; a means of determining the presence, quality, or truth of something; a trial:  a test of one's eyesight; subjecting a hypothesis to a test; a test of an athlete's endurance. "))
    end
  end
end
