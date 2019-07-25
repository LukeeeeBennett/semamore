#!/usr/bin/env ruby

require 'semamore_octo_client'

class Semamore
  def initialize(token:, client_options: {})
    @client = ::SemamoreOctoClient.new(token, options: client_options)
  end

  def changed_files_guard(repo:, branch:, command:, pattern:)
    files = client.current_pr_files(repo, branch)

    if has_matching_files?(pattern, files)
      exec command
    else
      exit 0
    end
  end

  private

  attr_reader :client

  def has_matching_files?(pattern, files)
    files.any? { |file| matches_pattern?(pattern, file[:filename]) }
  end

  def matches_pattern?(pattern, string)
    Regexp.new(pattern).match?(string)
  end
end
