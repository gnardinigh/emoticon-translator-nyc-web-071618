require 'yaml'


z = {"angel"=>["O:)", "☜(⌒▽⌒)☞"],
  "angry"=>[">:(", "ヽ(ｏ`皿′ｏ)ﾉ"],
  "bored"=>[":O", "(ΘεΘ;)"],
  "confused"=>["%)", "(゜.゜)"],
  "embarrased"=>[":$", "(#^.^#)"],
  "fish"=>["><>", ">゜))))彡"],
  "glasses"=>["8D", "(^0_0^)"],
  "grinning"=>["=D", "(￣ー￣)"],
  "happy"=>[":)", "(＾ｖ＾)"],
  "kiss"=>[":*", "(*^3^)/~☆"],
  "sad"=>[":'(", "(Ｔ▽Ｔ)"],
  "surprised"=>[":o", "o_O"],
  "wink"=>[";)", "(^_-)"]}


def load_library(file_path)
  a = YAML.load_file(file_path)

  translator_object = {"get_emoticon"=>{},"get_meaning"=>{}}


  emoticon_contents = a.collect {|name,array| {array[0]=>array[1]} }
  meaning_contents = a.collect {|name,array| {array[1]=>name}}

  for counter in 0..meaning_contents.size-1
    translator_object["get_emoticon"].merge!(emoticon_contents[counter])
    translator_object["get_meaning"].merge!(meaning_contents[counter])
  end

  return translator_object

end

def get_japanese_emoticon(file_path,emoticon)
  library_object = load_library(file_path)
  known_emotes = library_object["get_emoticon"].keys
  if known_emotes.include?(emoticon)
    return library_object["get_emoticon"][emoticon]
  else
    return "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(file_path,emoticon)
  library_object = load_library(file_path)
  known_emotes = library_object["get_meaning"].keys
  if known_emotes.include?(emoticon)
    return library_object["get_meaning"][emoticon]
  else
    return "Sorry, that emoticon was not found"
  end
end
