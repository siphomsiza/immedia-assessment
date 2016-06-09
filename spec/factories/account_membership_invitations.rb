FactoryGirl.define do
  factory :account_membership_invitation do
    account_id ""
inviter_id ""
invitee_id ""
invitee_email ""
role 1
status 1
data ""
invitation_code ""
invited_at "2016-04-12 09:22:52"
accepted_at "2016-04-12 09:22:52"
declined_at "2016-04-12 09:22:52"
re_invited_at "2016-04-12 09:22:52"
re_invite_requested_at "2016-04-12 09:22:52"
account_membership_id ""
last_action "MyString"
  end

end
