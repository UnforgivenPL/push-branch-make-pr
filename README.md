# push-branch

GitHub action to push a branch off of another branch.

# inputs

## repository
**Required**. Full `path/repository` of the repository to create branch in; must contain a `/`. The auth token must have write permissions to this repository.
## token
**Required**. Auth token with write permissions to the repository.
## target
** Required**. Name of the new branch. Must be a currently non-existing branch. You can use old branch names as long as the old branch has been deleted before this action runs.
## source
Name of the branch to branch off of. Defaults to repository's default branch.

# outputs

None. If the branch is created, the action is a success.
 
**Note:** If you use the regular auth token that is available to each GitHub action, creating and pushing the branch will **not** trigger other actions. Please use a properly scoped personal access token to achieve that. 

# disclaimer

This action is provided "as-is", without any liabilities or warranties. See the license for more information.

This action has been written by Miki Olsz of Unforgiven.pl. It uses Ruby, Docker and Ruby's GitHub API gem. Please submit bug reports, feature requests and the like. Thank you!
