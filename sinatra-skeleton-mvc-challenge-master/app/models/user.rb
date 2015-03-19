class User < ActiveRecord::Base
  has_many :tweets

  has_many :fan_relationships, class_name: "Relationship", foreign_key: "fan_id"

  has_many :fans, class_name: "User", through: :fan_relationships

  has_many :idol_relationships, class_name: "Relationship", foreign_key: "idol_id"

  has_many :idols, class_name: "User", through: :idol_relationships
end
