require 'spec_helper'

describe UserProfile do
  let(:subject) {create(:user_profile)}

  #Respond to relationship has one profile
  it { expect(subject).to respond_to :user }

  # #Respond to attributes
  # context "attrs for user profile" do
  #   it { expect(subject).to respond_to :firstname }
  #   it { expect(subject).to respond_to :lastname }
  #   it { expect(subject).to respond_to :picture }
  #   it { expect(subject).to respond_to :birthdate }
  #   it { expect(subject).to respond_to :gender }
  # end
  #
  # context "validations user profile" do
  #   it "validates user profile not valid" do
  #     subject.firstname = nil
  #     expect(subject).not_to be_valid
  #
  #     subject.lastname = ''
  #     expect(subject).not_to be_valid
  #
  #     subject.birthdate = ''
  #     expect(subject).not_to be_valid
  #
  #     subject.gender = ''
  #     expect(subject).not_to be_valid
  #   end
  #
  #   it "should be valid" do
  #     expect(subject).to be_valid
  #   end
  # end

end
