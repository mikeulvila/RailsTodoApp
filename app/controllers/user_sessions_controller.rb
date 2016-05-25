class UserSessionsController < ApplicationController
  def new
  end

  def create
    redirect_to todo_lists_path
  end
end
