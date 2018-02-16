require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/word')
require('pry')

get('/') do
  @word_list = Word.return_list
  erb(:word_list)
end

post('/') do
  added_word = params[:word]
  word_instance = Word.new({:word => added_word})
  word_instance.add_to_list
  @word_list = Word.return_list
  erb(:word_list)
end
