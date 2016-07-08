class Definition
  attr_reader(:description, :synonyms, :antonyms, :example)

  @@definitions = []

  define_method(:initialize) do |attributes|
    @description = attributes.fetch(:description)
    @synonyms = attributes.fetch(:synonyms)
    @antonyms = attributes.fetch(:antonyms)
    @example = attributes.fetch(:example)
  end

  define_method(:all) do
    @@definitions
  end

  define_method(:save) do
    @@definitions.push(self)
  end

  define_method(:clear) do
    @@definitions = []
  end
end
