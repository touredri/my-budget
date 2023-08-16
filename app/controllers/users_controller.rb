# frozen_string_literal: true

# Path: app\controllers\users_controller.rb
class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: :splash
  def splash; end
end
