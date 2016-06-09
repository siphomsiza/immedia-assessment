# Preview all emails at http://localhost:3000/rails/mailers/mailers/accounts/membership_invitations
class Mailers::Accounts::MembershipInvitationsPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/mailers/accounts/membership_invitations/invited
  def invited
    Mailers::Accounts::MembershipInvitations.invited
  end

  # Preview this email at http://localhost:3000/rails/mailers/mailers/accounts/membership_invitations/accepted
  def accepted
    Mailers::Accounts::MembershipInvitations.accepted
  end

  # Preview this email at http://localhost:3000/rails/mailers/mailers/accounts/membership_invitations/re_invited
  def re_invited
    Mailers::Accounts::MembershipInvitations.re_invited
  end

  # Preview this email at http://localhost:3000/rails/mailers/mailers/accounts/membership_invitations/requested_re_invite
  def requested_re_invite
    Mailers::Accounts::MembershipInvitations.requested_re_invite
  end

  # Preview this email at http://localhost:3000/rails/mailers/mailers/accounts/membership_invitations/declined
  def declined
    Mailers::Accounts::MembershipInvitations.declined
  end

end
