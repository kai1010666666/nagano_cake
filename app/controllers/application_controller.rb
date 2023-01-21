class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
    if resource == :admin
      admin_root_path
    elsif
      public_root_path
    end
  end
  def after_sign_out_path_for(resource)
    root_path
  end
end