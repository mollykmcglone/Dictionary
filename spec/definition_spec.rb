require('rspec')
require('definition')

describe('Definition') do

  describe("#description") do
    it("returns a phrase or sentence describing the meaning of a word") do
      test_definition = Definition.new({:description => "the principle or ideal of just dealing or right action", :synonyms => ["right", "equity"], :antonyms => ["wrong", "inequity"], :example => "The people of St. Paul, MN, demand justice after the senseless murder of another black man by police."})
      expect(test_definition.description()).to(eq("the principle or ideal of just dealing or right action"))
    end
  end

  describe("#synonyms") do
    it("returns an array of words that mean something similar to the word being described") do
      test_definition = Definition.new({:description => "the principle or ideal of just dealing or right action", :synonyms => ["right", "equity"], :antonyms => ["wrong", "inequity"], :example => "The people of St. Paul, MN, demand justice after the senseless murder of another black man by police."})
      expect(test_definition.synonyms()).to(eq(["right", "equity"]))
    end
  end

  describe("#antonyms") do
    it("returns an array of words that mean the opposite of the word being described") do
      test_definition = Definition.new({:description => "the principle or ideal of just dealing or right action", :synonyms => ["right", "equity"], :antonyms => ["wrong", "inequity"], :example => "The people of St. Paul, MN, demand justice after the senseless murder of another black man by police."})
      expect(test_definition.antonyms()).to(eq(["wrong", "inequity"]))
    end
  end

  describe("#example") do
    it("returns a phrase or sentence that correctly uses the word being described in context") do
      test_definition = Definition.new({:description => "the principle or ideal of just dealing or right action", :synonyms => ["right", "equity"], :antonyms => ["wrong", "inequity"], :example => "The people of St. Paul, MN, demand justice after the senseless murder of another black man by police."})
      expect(test_definition.example()).to(eq("The people of St. Paul, MN, demand justice after the senseless murder of another black man by police."))
    end
  end
end
