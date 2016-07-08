require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/definition')
require('./lib/word')

get('/') do
  @words = Word.all()
  erb(:index)
end

post('/word') do
  name = params.fetch("word_name")
  Word.new(name).save()
  @words = Word.all()
  erb(:index)
end

get('/:id') do
  @word = Word.find(params.fetch('id').to_i())
  erb(:word)
end

get('/definitions') do
  @definitions = Definition.all()
  erb(:word)
end

get('/vehicles/:id') do
  @word = Word.find(params.fetch("id").to_i())
  erb(:word)
end

post('/definitions') do
  description = params.fetch("description")
  synonyms = params.fetch("synonym")
  antonyms = params.fetch("antonym")
  example = params.fetch("example")
  @definition = Definition.new({:description => description, :synonyms => synonyms, :antonyms => antonyms, :example => example})
  @definition.save()
  @word = Word.find(params.fetch('word_id').to_i())
  @word.add_definition(@definition)
  erb(:word)
end
