function Start-VisualStudioWithFirstSlnFile(){
	ls *.sln | select -first 1 | %{ ii $_.FullName }
}
Set-Alias vs Start-VisualStudioWithFirstSlnFile

function Get-CurrentRepoName(){
	$repoPath = git rev-parse --show-toplevel
	$repoName = [io.path]::GetFileName($repoPath)
	return $repoName
}

function Get-CurrentBranchName(){
  	return git rev-parse --abbrev-ref HEAD
}

function Start-BitBucketAtCurrentRepo(){
	$repoName = Get-CurrentRepoName
	$url = "https://bitbucket.org/adbrain/" + $repoName + "/commits/all"
	Start-Process "chrome.exe" $url.ToLower()
}
Set-Alias bb Start-BitBucketAtCurrentRepo

function Start-GitHubAtCurrentRepo(){
	$repoName = Get-CurrentRepoName
  	$branchName = Get-CurrentBranchName
	$url = "https://github.com/mediaingenuity/" + $repoName + "/commits/" + $branchName
	Start-Process "chrome.exe" $url
}
Set-Alias gh Start-GitHubAtCurrentRepo
