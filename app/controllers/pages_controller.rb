# frozen_string_literal: true

class PagesController < ApplicationController
  before_action :authenticate_user!, only: %i[about contact friends]

  def home
    @user = User.new
  end

  def friends
    @user = current_user
  end

  def about; end

  def contact; end
end
