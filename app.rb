require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/word')
require('./lib/definition')
require('pry')


get('/') do
  @word_list = Word.return_list
  erb(:word_list)
end

post('/') do
  word_instance = Word.new(params[:word])
  word_instance.add_to_list
  # Word.sort
  @word_list = Word.return_list
  erb(:word_list)
end

get('/:word') do
  @current_word = params[:word]
  @word_list = Word.return_list
  current_definition = @word_list[@current_word]
  current_definition.api_return
  @definition = current_definition.parse_definition
  @part_of_speech = current_definition.parse_pos
  @custom_definitions = current_definition.custom_definitions
  erb(:definition)
end

post('/:word') do #custom definitions added
  @current_word = params[:word]
  @word_list = Word.return_list
  current_definition = @word_list[@current_word]
  current_definition.api_return
  @definition = current_definition.parse_definition
  @part_of_speech = current_definition.parse_pos
  current_definition.custom_definition(params[:definition])
  @custom_definitions = current_definition.custom_definitions
  erb(:definition)
end
