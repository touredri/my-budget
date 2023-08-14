# frozen_string_literal: true

class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: :splash
  def splash; end
end
