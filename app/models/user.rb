# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  username        :string(255)      not null
#  password_digest :string(255)      not null
#  created_at      :datetime
#  updated_at      :datetime
#  session_token   :string(255)
#

class User < ActiveRecord::Base

  attr_reader :password

  validates :username, :password_digest, presence: true
  validates :password, length: { minimum: 6, allow_nil: true }

  has_many :circle_memberships, inverse_of: :user

  has_many :owned_circles,
           class_name: "Circle",
           foreign_key: :owner_id,
           primary_key: :id

  has_many :memberships, through: :circle_memberships, source: :circle

  has_many :posts

  def password=(plaintext)
    @password = plaintext
    self.password_digest = BCrypt::Password.create(plaintext) if @password
  end

  def is_password?(plaintext)
    BCrypt::Password.new(self.password_digest).is_password?(plaintext)
  end

  def self.find_by_credentials(username, password)
    user = User.find_by_username(username)
    user.try(:is_password?, password) ? user : nil
  end

  def reset_session_token!
    self.session_token = SecureRandom.urlsafe_base64(16)
    self.save!
    self.session_token
  end
end
