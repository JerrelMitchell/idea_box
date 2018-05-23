class Admin::BaseController < ApplicationController
  before_action :require_admin, except: [:index, :show]

  private

    def require_admin
      render file: 'public/404' unless current_admin?
    end
end
