
include ActionView::Helpers::NumberHelper
RailsAdmin.config do |config|

  # == NAME ==

  config.main_app_name = [Settings.APP_NAME]

  # Instance labels
  config.label_methods = Settings.LABEL_METHODS

  ### Popular gems integration

  # == Devise ==
  config.authenticate_with do
    warden.authenticate! scope: :user
  end
  config.current_user_method(&:current_user)

  ## == Cancan ==
  # config.authorize_with :cancan

  ## == Pundit ==
  # config.authorize_with :pundit
  # config.authorize_with :pundit_nested

  ## == PaperTrail ==
  config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    history_index
    history_show

    ## has many Nested
    index_nested # mandatory
    new_nested
    export_nested
    bulk_delete_nested
    show_nested
    edit_nested
    delete_nested
    show_in_app_nested
    ## With an audit adapter, you can add:
    history_index_nested
    history_show_nested

  end

  config.included_models = [
    "User", "UserProfile","Location"
  ]

  config.compact_show_view = false
  config.total_columns_width = 99999


  #  ==> Global models configuration
  config.models do
    #   # Configuration here will affect all included models in all scopes, handle with care!
    list do
      #exclude_fields :created_at, :updated_at, :master
      #include_fields :id
    end

    edit do
      #exclude_fields_if do
      #  [:created_at, :updated_at, :master].include?(name) || name =~ /_id/ || name =~ /_count/
      #end
      fields_of_type :tag_list do
        partial 'tag_list_with_suggestions'
      end

    end

    fields_of_type :date do
      strftime_format "%Y-%m-%d"
      # Configuration here will affect all date fields, in the list section, for all included models. See README for a comprehensive type list.
    end

    fields_of_type :datetime do
      strftime_format "%Y-%m-%d %H:%M:%S"
      # Configuration here will affect all date fields, in the list section, for all included models. See README for a comprehensive type list.
    end

    fields_of_type :time do
      strftime_format "%Y-%m-%d %H:%M:%S"
      # Configuration here will affect all date fields, in the list section, for all included models. See README for a comprehensive type list.
    end

    fields_of_type :float do
      formatted_value do
        number_with_delimiter(number_with_precision(value.round(2), :precision => 2) )
      end
    end

    fields_of_type :decimal do
      formatted_value do
        number_with_delimiter(number_with_precision(value.round(2), :precision => 2) )
      end
    end

    fields_of_type :boolean do
      formatted_value do
        value ? "Yes" : "No"
      end
    end
    #
    # fields_of_type  :has_many_association  do
    #   pretty_value do
    #     v = bindings[:view]
    #     content_tag :ol,
    #     ([value].flatten.select(&:present?).map do |associated|
    #       amc = polymorphic? ? RailsAdmin::Config.model(associated) : associated_model_config # perf optimization for non-polymorphic associations
    #       am = amc.abstract_model
    #       wording = associated.send(amc.object_label_method)
    #       can_see = v.authorized?(:show, am, associated) && !am.embedded?
    #       can_see = can_see && (show_action = RailsAdmin::Config::Actions.find(:show, { :controller => v.controller, :abstract_model => am, :object => associated }))
    #       content_tag 'li',  can_see ? v.link_to(wording, v.url_for(:action => show_action.action_name, :model_name => am.to_param, :id => associated.id), :class => 'pjax') : wording
    #     end.join('').html_safe)
    #   end
    # end
    #
    # fields_of_type :has_and_belongs_to_many_association do
    #   pretty_value do
    #     v = bindings[:view]
    #     content_tag :ol,
    #     ([value].flatten.select(&:present?).map do |associated|
    #       amc = polymorphic? ? RailsAdmin::Config.model(associated) : associated_model_config # perf optimization for non-polymorphic associations
    #       am = amc.abstract_model
    #       wording = associated.send(amc.object_label_method)
    #       can_see = v.authorized?(:show, am, associated) && !am.embedded?
    #       can_see = can_see && (show_action = RailsAdmin::Config::Actions.find(:show, { :controller => v.controller, :abstract_model => am, :object => associated }))
    #       content_tag 'li',  can_see ? v.link_to(wording, v.url_for(:action => show_action.action_name, :model_name => am.to_param, :id => associated.id), :class => 'pjax') : wording
    #     end.join('').html_safe)
    #   end
    # end
  end

end
