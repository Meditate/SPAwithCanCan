require "rails_helper"

describe "abilities" do
  let(:editor) {create(:user, :editor)}
  let(:user){create(:user, :admin)}
  let(:other_user) {FactoryGirl.build_stubbed :user}
  subject (:ability){Ability.new(user)}

  context 'when user is an admin' do
    it{ should be_able_to(:manage, other_user) }
  end

  context 'when is an user' do
    it{ should be_able_to(:read, other_user) }
    it{ should_not be_able_to(:destroy,:update,:create, other_user)}
  end



end