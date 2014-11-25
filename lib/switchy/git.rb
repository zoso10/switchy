module Switchy
  class Git
    class << self
      def switch_remotes(args)
        each_remote do |remote|
          remote_name = remote.split("\t")[0]

          if remote =~ /git@git/
            # Switch to HTTPS
            user, repo = remote.split(':')[1].split('.')[0].split('/')
            `git remote set-url #{remote_name} https://github.com/#{user}/#{repo}.git`
          else
            # Switch to SSH
            user, repo = remote.split(',')[1].split('/')[1..-1]
            `git remote set-url #{remote_name} git@github.com:#{user}/#{repo}.git`
          end
        end
      end

      def repo_initialized?
        File.directory?('.git')
      end

    private

      def each_remote
        remotes = `git remote -v`
        remotes.split("\n").each do |remote|
          yield remote
        end
      end
    end
  end
end
