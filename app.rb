require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/word')
require('./lib/definition')
require('pry')


get('/') do
  @word_hash = Word.return_list
  @word_list = @word_hash.keys
  @word_list.sort!
  erb(:word_list)
end

post('/') do
  word_instance = Word.new(params[:word])
  word_instance.add_to_list
  # Word.sort
  @word_hash = Word.return_list
  @word_list = @word_hash.keys
  @word_list.sort!
  erb(:word_list)
end

get('/:word') do
  # definition
  @current_word = params[:word]
  @word_hash = Word.return_list
  current_definition = @word_hash[@current_word]
  current_definition.api_return
  @definition = current_definition.parse_definition
  @part_of_speech = current_definition.parse_pos
  @custom_definitions = current_definition.custom_definitions

  # synonyms
  @syns = current_definition.api_synonyms
  erb(:definition)
end

post('/:word') do #custom definitions added
  @current_word = params[:word]
  @word_hash = Word.return_list
  current_definition = @word_hash[@current_word]
  current_definition.api_return
  @definition = current_definition.parse_definition
  @part_of_speech = current_definition.parse_pos
  current_definition.custom_definition(params[:definition])
  @custom_definitions = current_definition.custom_definitions
  @syns = current_definition.api_synonyms
  erb(:definition)
end
