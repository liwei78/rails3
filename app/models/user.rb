require 'digest'

class User < ActiveRecord::Base
  attr_accessor :password
  attr_accessible :email, :name, :password, :password_confirmation
  
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
  validates :email, 
    :presence   => true,
    :format     => { :with => email_regex,  }, 
    :uniqueness => true
  
  validates :password,
    :presence => true,
    :confirmation => true, 
    :length => {:within => 4..20} 
    
  validates :name,
    :length => {:maximum => 16, :minimum => 3},
    :allow_blank => true

  before_save :encrypt_password
    
  def self.authenticate(email, password)
    user = find_by_email(email)
    return if user.nil?
    return user if user.right_password?(password)
  end
  
  def right_password?(password)
    encrypted_password == encrypt(password)
  end
  
  private
  
  def encrypt_password
    self.salt = make_salt if new_record?
    self.encrypted_password = encrypt(password)
  end
  
  def encrypt(str)
    secure_hash("#{salt}--#{str}")
  end
  
  def make_salt
    secure_hash("#{Time.now.utc}--#{password}")
  end
  
  def secure_hash(str)
    Digest::SHA2.hexdigest(str)
  end
end
