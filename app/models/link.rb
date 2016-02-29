require 'uri'

class Link < ActiveRecord::Base
	validates :url, :format => URI::regexp(%w(http https))
	validates :title, presence: true
	belongs_to :user

	def read_status_name
		read ? "Mark as Read" : "Mark as Unread"
  end

end
