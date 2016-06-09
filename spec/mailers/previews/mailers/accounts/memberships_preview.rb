# Preview all emails at http://localhost:3000/rails/mailers/mailers/accounts/memberships
class Mailers::Accounts::MembershipsPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/mailers/accounts/memberships/created
  def created
    Mailers::Accounts::Memberships.created
  end

  # Preview this email at http://localhost:3000/rails/mailers/mailers/accounts/memberships/updated
  def updated
    Mailers::Accounts::Memberships.updated
  end

end
