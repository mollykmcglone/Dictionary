class Word
  @@words = []

  define_method(:initialize) do |name|
    @name = name
    @meanings = []
    @id = @@words.length().+(1)
  end

  define_method(:name) do
    @name
  end

  define_method(:meanings) do
    @meanings
  end

  define_method(:id) do
    @id
  end

  define_singleton_method(:all) do
    @@words
  end

  define_method(:save) do
    @@words.push(self)
  end

  define_singleton_method(:clear) do
    @@words = []
  end

  define_singleton_method(:find) do |id|
    found_word = nil
    @@words.each() do |word|
      if word.id().eql?(id)
        found_word = word
      end
    end
    found_word
  end

  define_method(:add_definition) do |definition|
    @meanings.push(definition)
  end
end
