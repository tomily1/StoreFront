class AuthenticationsController < ApplicationController

  def new
    @command = Commands::AuthenticateUser.new
  end

  def create
    @command = Commands::AuthenticateUser.new(params.permit(:email))

    if @command.execute
      sign_in_user!(@command.result)
      redirect_to root_path
    else
      redirect_to root_path
    end
  end
end