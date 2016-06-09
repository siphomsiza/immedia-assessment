class HomeController < ApplicationController
  def index
    flash.keep
    redirect_to rails_admin.index_path(model_name: '', section: 'home', subsection: 'main')
  end

  def fowarder
    u = params[:fowarder]||{}
    _action = u.delete(:action) || 'dashboard'
    redirect_to  rails_admin.send("#{_action}_path", u)
  end
end
