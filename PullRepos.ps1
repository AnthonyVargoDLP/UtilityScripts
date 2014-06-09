#******************************************************************************
# PullRepos                                                                   #
#                                                                             #
#   Given a comma-delimited list of paths to git repositories in the          #
#   $gitRepositoriesEnvName environment variable, this will perform a         #
#                                                                             #
#       git pull --rebase                                                     #
#                                                                             #
#   for each repository.                                                      #
#                                                                             #
#******************************************************************************

$gitRepositoriesEnvName = "GitRepositories"
$gitRepositories = [System.Environment]::GetEnvironmentVariable($gitRepositoriesEnvName)

If ([string]::IsNullOrWhiteSpace($gitRepositories))
{
    Write-Output "No repositories defined in $gitRepositoriesEnvName."
}
else
{
    $pwd = pwd
    
    ForEach ($repo in $gitRepositories.Split(','))
    {
        Write-Output "Pulling [$repo]..."
        
        cd $repo
        git pull --rebase
    }
    
    cd $pwd
}