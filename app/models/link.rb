# == Schema Information
#
# Table name: links
#
#  id         :integer          not null, primary key
#  post_id    :integer
#  url        :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Link < ActiveRecord::Base
  validates :post, :url, null: false

  belongs_to :post, inverse_of: :links
end
