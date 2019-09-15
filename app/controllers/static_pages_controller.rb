class StaticPagesController < ApplicationController
  before_action :authenticate_user!
  
  def home
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end

  def choose_subject

  end
end
