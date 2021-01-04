class User < ActiveRecord::Base
has_many :reviews
has_many :restrooms, through: :reviews
end
