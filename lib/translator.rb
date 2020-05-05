require 'yaml'

# require modules here

def load_library(lib)
  new_hash = {}
  emoties = YAML.load_file(lib)

  emoties.each_pair do |key, val_array|
    new_hash[key] = {:english => val_array[0], :japanese => val_array[1]}
  end
  # p new_hash
  new_hash
 end

def get_japanese_emoticon(lib, english_emoticon)
  hash = load_library("./lib/emoticons.yml")
  hash.each_pair do |emotion, lang|
    if lang[:english] === english_emoticon
      return lang[:japanese]
    end
  end
  return "Sorry, that emoticon was not found"
end

def get_english_meaning(lib, japanese_emoticon)
  hash = load_library("./lib/emoticons.yml")
  hash.each_pair do |emotion, lang|
    if lang[:japanese] === japanese_emoticon
      return emotion 
    end
  end
  return "Sorry, that emoticon was not found"
end