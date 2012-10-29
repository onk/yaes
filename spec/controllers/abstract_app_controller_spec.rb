require 'spec_helper'

describe AbstractAppController do
  # for before filter test
  controller(AbstractAppController) do
    def index
      render text: "dummy"
    end
  end

  describe "#authenticate_container_user!" do
    before {
      @user = FactoryGirl.create(:user, container_user_id: "1")
      get "index", opensocial_owner_id: "1"
    }
    it { assigns["current_container_user"].should == @user }
    it { controller.current_container_user.should == @user }
    it { controller.current_user.should == @user }
    it { session[:current_container_user_id].should == @user.container_user_id }
  end
end

