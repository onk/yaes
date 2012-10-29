class UsersController < AbstractAppController
  def home
    @information = Topic.information.page(1).per(3)
  end
end
