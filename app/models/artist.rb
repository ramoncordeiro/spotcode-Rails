#class Artist < ApplicationRecord
#    has_many :albums
#  ​
#    validates :name, presence: true
#    has_one_attached :photo
#  end

class Artist < ApplicationRecord
  has_many :albums

  validates :name, presence: true
  has_one_attached :photo
end