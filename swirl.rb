require 'nokogiri'

# Parses HTML string with affiliate links
# Requires the HTML string and the DB object

class Swirl
  def add_html(htmlString)
    @html = Nokogiri::HTML.fragment(htmlString)
  end

  def use_affiliate_database(db)
    @db = db
  end

  def money_making_html
    raise 'HTML string is missing' unless @html
    return output_html_string unless @db

    @html.traverse do |node|
      # Skip unless the node contains text
      next unless node.is_a? Nokogiri::XML::Text

      rawWords = node.text.split(' ')
      strippedWords = rawWords.map { |word| strip_punctuations(word) }
      linkedWords = check_words(strippedWords)

      # Update the node content with the linked text
      node.content = linkedWords.join(' ')
    end

    output_html_string
  end

  private

  def strip_punctuations(word)
    word.gsub(/[^a-z0-9]/i, '')
  end

  def check_words(words)
    words.map do |word|
      if @db.has_word?(word.downcase)
        links = @db.get_links_for_word(word.downcase)
        linkify_word(word, links)
      else
        word
      end
    end
  end

  def linkify_word(word, links)
    link = find_highest_affiliate_amount(links)
    "\<a href=\"#{link}\" target=\"_blank\">#{word}</a>"
  end

  def find_highest_affiliate_amount(links)
    link_with_highest_amount = links.max_by do |link|
      link[:amount]
    end

    link_with_highest_amount[:url]
  end

  def output_html_string
    replace_escaped_characters(@html.to_html)
  end

  def replace_escaped_characters(string)
    string.gsub('&lt;', '<').gsub('&gt;', '>')
  end
end
