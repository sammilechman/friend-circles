# == Schema Information
#
# Table name: circle_memberships
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  circle_id  :integer
#  created_at :datetime
#  updated_at :datetime
#

class CircleMembership < ActiveRecord::Base

  validates :user, :circle, presence: true

  belongs_to :user
  belongs_to :circle


end
