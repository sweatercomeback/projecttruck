require 'digest/sha1'

class User < ActiveRecord::Base
  validates_length_of :login, :within => 3..40
  validates_length_of :password, :within => 5..40
  validates_presence_of :login, :email, :password, :password_confirmation, :salt
  validates_uniqueness_of :login, :email
  validates_confirmation_of :password
  validates_format_of :email, :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i, :message => "Invalid email"
  has_many :vehicles
  has_many :messages
  has_many :photos
  acts_as_mappable

  attr_protected :id, :salt

  attr_accessor :password, :password_confirmation
    
  def self.authenticate(login, pass)
    u=find(:first, :conditions=>["login = ?", login])
    return nil if u.nil?
    if User.encrypt(pass, u.salt)==u.hashed_password
      return u.id
    else
      return nil
    end
  end  

  def password=(pass)
    @password=pass
    self.salt = User.random_string(10) if !self.salt?
    self.hashed_password = User.encrypt(@password, self.salt)
  end
  
  def send_new_password
    new_pass = User.random_string(10)
    self.password = self.password_confirmation = new_pass
    self.save
    Notifications.deliver_forgot_password(self.email, self.login, new_pass)
  end
  
  alias photos_all :photos
  def photos
    return Photo.find(:all, :conditions => ['user_id = ? and parent_id is null', self.id])
  end

  protected

  def self.encrypt(pass, salt)
    Digest::SHA1.hexdigest(pass+salt)
  end
  
  def self.random_string(len)
    #generat a random password consisting of strings and digits
    chars = ("a".."z").to_a + ("A".."Z").to_a + ("0".."9").to_a
    newpass = ""
    1.upto(len) { |i| newpass << chars[rand(chars.size-1)] }
    return newpass
  end
  
  def self.find_recent(minutes_offset=20)
    filter_date = Time.now - minutes_offset.minutes
    return self.find(:all, :conditions => ['last_activity_date > ?', filter_date])
  end
  

  
end
