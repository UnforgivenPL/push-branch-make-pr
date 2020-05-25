# written by Miki Olsz / (c) 2020 Unforgiven.pl
# released under Apache 2.0 License

require 'github_api'

unless ARGV.size >= 3 && ARGV[0].include?('/')
  puts <<HELP
incorrect parameter syntax or less than three parameter provided, which is probably NOT what was intended
this script supports the following parameters:
  0 = owner/repository           (required; must contain /)
  1 = auth token                 (required; must have write access to the repository)
  2 = new branch name            (required)
  3 = source branch              (default: default branch of the repository)
HELP
end

user, repository = *ARGV[0].split('/')
token, target_branch = ARGV[1], ARGV[2]

github = Github.new(oauth_token: token)
begin
  source = (ARGV[3] != '-' && ARGV[3]) || github.repositories.get(user: user, repo: repository)[:default_branch]
  puts "attempting to create branch #{target_branch} from #{source} in #{user}/#{repository}..."
  source_sha = github.git_data.references.get(user: user, repo: repository, ref: 'heads/'+source).object[:sha]
  target = github.git_data.references.create( user: user, repo: repository, ref: 'refs/heads/'+target_branch, sha: source_sha)
  puts "...branch successfully created; thank you and goodbye!"
rescue Github::Error::NotFound => e
  puts e.message
  puts e.backtrace.inspect
  exit 404
end
