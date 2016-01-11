class Link < ActiveRecord::Base
  belongs_to :user
  validates :url, url: true
  validates :title, presence: true

  def status_text
    status ? "Mark as unread" : "Mark as read"
  end

  def status_class
    status ? "grey" : "normal"
  end
end
