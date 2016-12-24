# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  username        :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ActiveRecord::Base
  has_many :cats

  has_many :rental_requests,
    foreign_key: :requester_id,
    class_name: "CatRentalRequest"

  validates :username, :password_digest, :session_token, presence: true
  validates :username, :session_token, uniqueness: true
  after_initialize :ensure_session_token

  attr_reader :password

  def generate_session_token
    SecureRandom::urlsafe_base64(128)
  end

  def ensure_session_token
    self.session_token ||= generate_session_token
  end

  def reset_session_token!
    self.session_token = generate_session_token
    self.save!
    self.session_token
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    bcrypt_pass = BCrypt::Password.new(self.password_digest)
    bcrypt_pass.is_password?(password)
  end

  def self.find_by_credentials(username, password)
    user = User.find_by(username: username)
    return nil if user.nil?
    user.is_password?(password) ? user : nil
  end
end
