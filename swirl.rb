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
    return @html.to_s unless @db

    @html.to_s
  end
end
