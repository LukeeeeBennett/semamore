#!/usr/bin/env ruby

require 'semamore_octo_client'

class Semamore
  def initialize(token:, client_options: {})
    p 'Starting semamore...'
    @client = ::SemamoreOctoClient.new(token, options: client_options)
  end

  def changed_files_guard(repo:, branch:, command:, pattern:)
    p "Finding changed files on #{branch} that match #{pattern}..."
    files = client.current_pr_files(repo, branch)

    if has_matching_files?(pattern, files)
      p "Found matching changed files, executing `#{command}`..."
      exec command
    else
      p "No matching changed files found, skipping `#{command}`."
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
