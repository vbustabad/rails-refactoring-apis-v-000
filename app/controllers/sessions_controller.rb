class SessionsController < ApplicationController
  skip_before_action :authenticate_user, only: :create

  def create
    @service = GithubService.new
    session[:token] = @service.authenticate!(ENV['GITHUB_CLIENT'], ENV['GITHUB_SECRET'], params[:code])
    @service.get_username
    redirect_to root_path
  end
end
