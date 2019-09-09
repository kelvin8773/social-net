# frozen_string_literal: true

class PagesController < ApplicationController
  before_action :authenticate_user!, only: %i[about contact]

  def home; end

  def about; end

  def contact; end
end
