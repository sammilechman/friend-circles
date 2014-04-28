# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  body       :string(255)      not null
#  user_id    :integer          not null
#  created_at :datetime
#  updated_at :datetime
#

class Post < ActiveRecord::Base
  validates :body, :user, null: false

  belongs_to :user

  has_many :links, inverse_of: :post

  has_many :post_shares, inverse_of: :post

  has_many :circles, through: :post_shares, source: :circle
end
