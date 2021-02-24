class StaticsPagesController < ApplicationController
  before_action :logged_in_user, only: [:top]
  def home
  end

  def top
  end

  def instructor
  end

  def plan
  end
end