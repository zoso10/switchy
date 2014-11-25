module Switchy
  class CLI
    def self.start
      begin
        raise GitRepoError unless Git.repo_initialized?
        Git.switch_remotes(ARGV)
      rescue GitRepoError
        puts "Not a git repository, can't switch remote urls!"
      end
    end
  end
end
