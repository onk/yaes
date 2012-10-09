require 'spec_helper'

describe UsersController do
  subject { request }
  let(:user) { FactoryGirl.create(:user) }

  describe "GET 'home'" do
    let(:params) { {opensocial_owner_id: user.container_user_id} }
    let(:request) { get "home", params }
    it { should be_success }
  end
end

