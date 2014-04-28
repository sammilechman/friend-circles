# == Schema Information
#
# Table name: post_shares
#
#  id         :integer          not null, primary key
#  post_id    :integer
#  circle_id  :integer
#  created_at :datetime
#  updated_at :datetime
#

class PostShare < ActiveRecord::Base
  validates :post, :circle, null: false

  belongs_to :post, inverse_of: :post_share

  belongs_to :circle, inverse_of: :post_share
end
