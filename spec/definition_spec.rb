require('rspec')
require('definition')

describe('Definition') do

  describe("#description") do
    it("returns a phrase or sentence describing the meaning of a word") do
      test_definition = Definition.new("the quality of being just, impartial, or fair")
      expect(test_definition.description()).to(eq("the quality of being just, impartial, or fair"))
    end
  end
end
