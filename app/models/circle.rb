# == Schema Information
#
# Table name: circles
#
#  id         :integer          not null, primary key
#  name       :string(255)      not null
#  owner_id   :integer          not null
#  created_at :datetime
#  updated_at :datetime
#

class Circle < ActiveRecord::Base

  validates :name, :owner, presence: true

  belongs_to :owner,
             class_name: "User",
             foreign_key: :owner_id,
             primary_key: :id

  has_many :circle_memberships, inverse_of: :circle

  has_many :users, through: :circle_memberships, source: :user

  has_many :post_shares, inverse_of: :circle

  has_many :posts, through: :post_shares, source: :post

end
