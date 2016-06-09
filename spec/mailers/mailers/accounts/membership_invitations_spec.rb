require "rails_helper"

RSpec.describe Mailers::Accounts::MembershipInvitations, type: :mailer do
  describe "invited" do
    let(:mail) { Mailers::Accounts::MembershipInvitations.invited }

    it "renders the headers" do
      expect(mail.subject).to eq("Invited")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

  describe "accepted" do
    let(:mail) { Mailers::Accounts::MembershipInvitations.accepted }

    it "renders the headers" do
      expect(mail.subject).to eq("Accepted")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

  describe "re_invited" do
    let(:mail) { Mailers::Accounts::MembershipInvitations.re_invited }

    it "renders the headers" do
      expect(mail.subject).to eq("Re invited")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

  describe "requested_re_invite" do
    let(:mail) { Mailers::Accounts::MembershipInvitations.requested_re_invite }

    it "renders the headers" do
      expect(mail.subject).to eq("Requested re invite")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

  describe "declined" do
    let(:mail) { Mailers::Accounts::MembershipInvitations.declined }

    it "renders the headers" do
      expect(mail.subject).to eq("Declined")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

end
