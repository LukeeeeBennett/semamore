require 'octokit'

class SemamoreOctoClient
  def initialize(token, options: { auto_paginate: true })
    @client = Octokit::Client.new(options.merge(access_token: token))
  end

  def current_pr_files(repo, branch)
    client.pull_request_files(repo, current_pr(repo, branch)[:number])
  end

  def current_pr(repo, branch)
    open_prs(repo).select {|pr| pr[:head][:ref] == branch}.first
  end

  def open_prs(repo)
    client.pull_requests(repo, :state => "open")
  end

  private

  attr_reader :repo, :branch, :client
end
