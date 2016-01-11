class LinkPresenter
  attr_reader :links, :blank_link

  def initialize(links, blank_link)
    @links = links
    @blank_link = blank_link
  end
end
