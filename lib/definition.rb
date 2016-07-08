class Definition
  attr_reader(:description, :synonyms, :antonyms, :example)

  define_method(:initialize) do |attributes|
    @description = params.fetch(:description)
    @synonyms = params.fetch(:synonyms)
    @antonyms = params.fetch(:antonyms)
    @example = params.fetch(:example)
  end
end
