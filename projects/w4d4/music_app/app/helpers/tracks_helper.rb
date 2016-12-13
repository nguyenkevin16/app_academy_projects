module TracksHelper
  def ugly_lyrics(lyrics)
    split_lyrics = lyrics.split("\n")

    html = ""
    split_lyrics.each do |line|
      html += "<pre>&#9835 #{h(line)}</pre>\n"
    end
    html.html_safe
  end
end
