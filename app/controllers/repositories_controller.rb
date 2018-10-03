class RepositoriesController < ApplicationController
  def index
    @service = GithubService.new
    @repos_array = @service.get_repos
  end

  def create
    @service = GithubService.new
    @service.create_repo(params[:name])
    redirect_to '/'
  end
end
