require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/definition')
require('./lib/word')

get('/') do
  @words = Word.all()
  erb(:index)
end

post('/add_word') do
  name = params.fetch("word_name")
  Word.new(name).save()
  @words = Word.all()
  erb(:index)
end

get('words/:id') do
  @word = Word.find(params.fetch('id').to_i())
  erb(:word)
end

post('/definitions') do
  description = params.fetch("description")
  synonyms = params.fetch("synonyms")
  antonyms = params.fetch("antonyms")
  example = params.fetch("example")
  @definition = Definition.new({:description => description, :synonyms => synonyms, :antonyms => antonyms, :example => example})
  @definition.save()
  @word = Word.find(params.fetch('word_id').to_i())
  @word.add_definition(@definition)
end
