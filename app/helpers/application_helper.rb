module ApplicationHelper

  def current_year
    Time.current.year
  end

  def github_link(author, repo)
    link_to "Project github", "https://github.com/#{author}/#{repo}", target: :_blank
  end

end
