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
  added_word = params[:word]
  word_instance = Word.new({:word => added_word})
  word_instance.add_to_list
  # Word.sort
  @word_list = Word.return_list
  erb(:word_list)
end

get('/:word') do
  @current_word = params[:word]
  definition = Definition.new(@current_word)
  @definition = definition.parse_definition
  @part_of_speech = definition.parse_pos
  @custom_definitions = []
  erb(:definition)
end

post('/:word') do #custom definitions added
  @current_word = params[:word]
  definition = Definition.new(@current_word)
  definition.custom_definition(params[:definition])
  @definition = definition.parse_definition
  @part_of_speech = definition.parse_pos
  @custom_definitions = definition.custom_definitions
  erb(:definition)
end
