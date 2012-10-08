class User < AbstractAppModel
  attr_accessible :container_user_id, :nickname
  acts_as_paranoid
end
