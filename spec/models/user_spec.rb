require 'spec_helper'
require 'RMagick'

describe User do
  let(:subject) {create(:user)}

  #Respond to relationship has one profile
  it { expect(subject).to respond_to :profile }

  #Respond to attributes
  context "attrs" do
    it { expect(subject).to respond_to :email }
    it { expect(subject).to respond_to :system_admin }
    it { expect(subject).to respond_to :active }
  end

  context "validations" do
    it "validates user not valid" do
      subject.email = nil
      expect(subject).not_to be_valid

      subject.password = ''
      expect(subject).not_to be_valid
    end

    it "validates user not valid without profile" do
      subject.profile = nil
      expect(subject).not_to be_valid
    end

    it "should be valid" do
      expect(subject).to be_valid
    end
  end

end
