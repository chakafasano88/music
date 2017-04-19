class Users < ActiveRecord::Base
  has_many :posts
end

class Posts < ActiveRecord::Base
  belongs_to :users
end
