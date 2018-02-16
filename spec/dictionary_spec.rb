require('rspec')
require('word')
require('pry')

describe('Word') do
  describe('#initialize')
    it("takes hash of properties as argument and instantiates a new word") do
      test_attributes = { :word => 'test', :definition => 'test definition' }
      test_word = Word.new(test_attributes)
      expect(test_word.word).to(eq('test'))
      expect(test_word.definition).to(eq('test definition'))
    end
end
