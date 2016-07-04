require "rails_helper"

describe "abilities" do
  let(:user) {create(:user)}
  let(:editor) {create(:user, :editor)}
  let(:admin){create(:user, :admin)}
  let(:other_user) {FactoryGirl.build_stubbed :user}

  context 'when user is not loged in' do
    subject(:ability){Ability.new(nil)}
    it{should_not be_able_to(:manage, :all)}
  end

  context 'when user is an user' do
    subject (:ability){Ability.new(user)}
    it{ should be_able_to(:readshow, user) }
    it{ should be_able_to(:readindex, User) }
    it{ should_not be_able_to(:readshow, other_user)}
    it{ should_not be_able_to(:destroy,:update,:create, other_user)}
  end

  context 'when user is an admin' do
    subject (:ability){Ability.new(admin)}
    it{ should be_able_to(:manage, other_user) }
  end


end