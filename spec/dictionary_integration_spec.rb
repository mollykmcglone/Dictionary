require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('add a new word from index path', {:type => :feature}) do
  it ("allows a user to submit a new word and adds it to the list of words") do
    visit('/')
    fill_in('word_name', :with => 'Socialism')
    click_button('Submit')
    expect(page).to have_content('Socialism')
  end
end

describe('view the definition(s) of a word from index path', {:type => :feature}) do
  it ("allows a user to click on a word and view its definitions") do
    visit('/')
    fill_in('word_name', :with => 'Capitalism')
    click_button('Submit')
    expect(page).to have_content('Capitalism')
    click_link('Capitalism')
    expect(page).to have_content('Add a new definition to Capitalism')
  end
end

describe('add a definition to a word from the word path', {:type => :feature}) do
  it ("allows a user to submit a description, synonyms, antonyms, and example phrase/sentence and adds the complete definition to the list of definitions for the word.") do
    visit('/')
    fill_in('word_name', :with => 'Freedom')
    click_button('Submit')
    expect(page).to have_content('Freedom')
    click_link('Freedom')
    expect(page).to have_content('Add a new definition to Freedom')
    fill_in('description', :with => 'the state of being free from the control or power of another')
    fill_in('synonym', :with => ['emancipation', 'autonomy'])
    fill_in('antonym', :with => ['subjection', 'dependence'])
    fill_in('example', :with => 'She has the freedom to do as she likes')
    click_button('Submit')
    expect(page).to have_content('She has the freedom to do as she likes')
  end
end

describe('return home from word path', {:type => :feature}) do
  it ("allows a user to return to the main dictionary page after visiting a word's page") do
    visit('/')
    fill_in('word_name', :with => 'Joy')
    click_button('Submit')
    expect(page).to have_content('Joy')
    click_link('Joy')
    expect(page).to have_content('Add a new definition to Joy')
    fill_in('description', :with => 'a feeling of great happiness')
    fill_in('synonym', :with => ['delight', 'bliss'])
    fill_in('antonym', :with => ['sadness', 'misery'])
    fill_in('example', :with => 'Spring wildflowers are a joy to behold.')
    click_button('Submit')
    expect(page).to have_content('Spring wildflowers are a joy to behold.')
    click_link('Return to Dictionary')
    expect(page).to have_content('Your words')
  end
end
