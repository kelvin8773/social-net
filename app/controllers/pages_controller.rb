# frozen_string_literal: true

class PagesController < ApplicationController
  before_action :authenticate_user!, only: %i[about contact]

  def home
    @user = User.new
  end

  def about; end

  def contact; end
end
