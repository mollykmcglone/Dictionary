require('rspec')
require('word')
require('definition')

describe(Word) do
  before() do
    Word.clear()
  end

  describe("#name") do
    it("returns the word itself") do
      test_word = Word.new("Justice")
      expect(test_word.name()).to(eq("Justice"))
    end
  end

  describe("#id") do
    it("returns the id of the word") do
      test_word = Word.new("Justice")
      expect(test_word.id()).to(eq(1))
    end
  end

  describe("#definitions") do
    it("returns an array of definitions for the word that is empty at first")
      test_word = Word.new("Justice")
      expect(test_word.definitions()).to(eq([]))
    end
  end

  describe("#save") do
    it("adds a word to the array of saved words") do
      test_word = Word.new("Justice")
      test_word.save()
      expect(Word.all()).to(eq([test_word]))
    end
  end

  describe(".all") do
    it("returns an array of all the words that is empty at first") do
      expect(Word.all()).to(eq([]))
    end
  end

  describe(".clear") do
    it("empties out all of the saved words from the array") do
      Word.new("Justice").save()
      Word.clear()
      expect(Word.all()).to(eq([]))
    end
  end

  describe(".find") do
    it("returns a word by its id number") do
      test_word = Word.new("Justice")
      test_word.save()
      test_word2 = Word.new("Peace")
      test_word2.save()
      expect(Word.find(test_word.id())).to(eq(test_word))
    end
  end

  describe("#add_definition") do
    it("adds a new definition to a word") do
      test_word = Word.new("Justice")
      test_definition = Definition.new("the quality of being just, impartial, or fair")
      test_word.add_definition(test_definition)
      expect(test_word.definitions()).to(eq([test_definition]))
    end
  end
end
