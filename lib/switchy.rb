require 'switchy/cli'
require 'switchy/git'
require 'switchy/exceptions'
require 'switchy/version'

module Switchy
=begin
  class << self
    def switch
      unless git_repository?
        puts "Not a git repository, can't switch remote urls!"
        return
      else
        each_remote do |remote|
          remote_name = remote.split("\t")[0]

          if remote =~ /git@git/
            # Switch to HTTPS
            user, repo = remote.split(':')[1].split('.')[0].split('/')
            `git remote set-url #{remote_name} https://github.com/#{user}/#{repo}.git`
          else
            # Switch to SSH
            user, repo = remote.split('.')[1].split('/')[1..-1]
            `git remote set-url #{remote_name} git@github.com:#{user}/#{repo}.git`
          end
        end
      end
    end

  private

    def git_repository?
      File.directory?('.git')
    end

    def each_remote
      remotes = `git remote -v`
      remotes.split("\n").each do |remote|
        yield remote
      end
    end
  end
=end
end
