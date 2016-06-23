class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  skip_before_filter :authenticate_user!
  def foursquare
    @user = User.from_omniauth(request.env["omniauth.auth"])
    @user.skip_confirmation! if @user.present?
    unless @user.save
      user = Users::User.find_by(email: @user.email)
      if user.present?
        user.uid = @user.uid
        user.provider = @user.provider
        user.skip_confirmation!
        if user.save!
          @user = user
        end
      end
    end
    sign_in_and_redirect @user
  end

  def instagram
    @user = User.from_omniauth_instagram(request.env["omniauth.auth"])
    @user.skip_confirmation! if @user.present?
    unless @user.save
      user = User.find_by(email: @user.email)
      if user.present?
        user.uid = @user.uid
        user.provider = @user.provider
        user.skip_confirmation!
        if user.save!
          @user = user
        end
      end
    end
    sign_in_and_redirect @user
  end
end
