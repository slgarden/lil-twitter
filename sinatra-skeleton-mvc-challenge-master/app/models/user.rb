class User < ActiveRecord::Base

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates_format_of :email, :with => \b[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\b, :on => :create
  validates :username, presence: true, uniqueness: true
  validates :password, presence: true

  has_many :tweets

  has_many :fan_relationships, class_name: "Relationship", foreign_key: "fan_id"
  has_many :fans, class_name: "User", through: :fan_relationships

  has_many :idol_relationships, class_name: "Relationship", foreign_key: "idol_id"
  has_many :idols, class_name: "User", through: :idol_relationships

  def authenticate(input_password)
    self.password == input_password
  end

end
