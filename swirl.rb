require 'nokogiri'
require 'byebug'

class Swirl
  def initialize
  end

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
      next unless node.is_a? Nokogiri::XML::Text

      rawWords = node.text.split(' ')
      words = rawWords.map { |word| strip_punctuations(word) }

      words.map! do |word|
        if @db.has_word?(word.downcase)
          links = @db.get_links_for_word(word.downcase)
          linkify_word(word, links)
        else
          word
        end
      end

      node.content = words.join(' ')
    end

    output_html_string
  end

  private

  def strip_punctuations(word)
    word.gsub(/[^a-z0-9]/i, '')
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
