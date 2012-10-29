require 'spec_helper'

describe TopicsController do
  subject { request }
  let(:user) { FactoryGirl.create(:user) }

  describe "GET 'show'" do
    let(:topic) { FactoryGirl.create(:published_topic) }
    let(:params) { {opensocial_owner_id: user.container_user_id, id: topic.id} }
    let(:request) { get "show", params }
    it { should be_success }
  end

  describe "GET 'information'" do
    let(:params) { {opensocial_owner_id: user.container_user_id} }
    let(:request) { get "information", params }
    it { should be_success }
  end
end
