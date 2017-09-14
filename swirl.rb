class Swirl
  def initialize
  end

  def add_html(htmlString)
    @html = htmlString
  end

  def use_affiliate_database(db)
    @db = db
  end

  def money_making_html
    raise 'HTML string is missing' unless @html

    @html
  end
end
