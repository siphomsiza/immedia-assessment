require_relative "../../lib/devise/strategies/json_web_token.rb"
class ApplicationController < ActionController::Base
  POLICY_SCOPE_ACTIONS = [
    :index,
    :index_nested,
    :dashboard
    ]

  layout :choose_layout

  before_action :configure_permitted_parameters, if: :devise_controller?

  prepend_before_action :authenticate_user!

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  skip_before_action :verify_authenticity_token, if: Proc.new { |c| @skip_verify_authenticity_token || c.request.format.json? }
  protect_from_forgery with: :null_session, only: Proc.new { |c| @skip_verify_authenticity_token || c.request.format.json? }

  # after_action :verify_authorized, except: POLICY_SCOPE_ACTIONS, unless: :devise_controller?
  # after_action :verify_policy_scoped, only: POLICY_SCOPE_ACTIONS, unless: :devise_controller?

  helper_method :section,
  :subsection,
  :random_id,
  :second_random_id



  def section
    @section
  end

  def subsection
    @subsection
  end

  def random_id
    @random_id ||= Time.now.to_i + rand(10000)
  end

  def second_random_id
    @second_random_id ||= Time.now.to_i + rand(10000)
  end


  def info_for_paper_trail
    data = {data: {ip: request.remote_ip, browser: request.env['HTTP_USER_AGENT']}}
    if section == "current_user"
      data[:item_owner_type] = current_user.class.name
      data[:item_owner_id] = current_user.id
    end
    data
  end

  protected

  def set_section
    Rails.logger.info "set_section"
    @section = params[:section]
  end

  def set_subsection
    Rails.logger.info "set_subsection"
    @subsection = params[:subsection]
  end

  def default_params(key)
    (params[key] ||= ActionController::Parameters.new({}))
  end

  def configure_permitted_parameters
    Rails.logger.info "configure_permitted_parameters"

    # Fields for sign up
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:id, :email, :system_admin, :active, :firstname, :lastname, :birthdate, :gender, :country_id , :subdivision_id, :area_id, :suburb_id,  :picture, :password, :password_confirmation, :receive_newsletter) }
    # Fields for editing an existing account
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:id, :email, :system_admin, :active, :firstname, :lastname, :birthdate, :gender, :country_id , :subdivision_id, :area_id, :suburb_id, :picture, :password, :current_password, :password_confirmation, :receive_newsletter)}
  end

  def choose_layout
    devise_controller?  ? "outside" :  "application"
  end

  def set_api_header!
    Rails.logger.info "set_api_header!"
    if request.format.symbol == :json
      Thread.current[:is_api] =  true
    else
      Thread.current[:is_api] = false
    end
  end


end
