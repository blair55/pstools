function Start-VisualStudioWithFirstSlnFile(){
    ls *.sln | select -first 1 | %{ ii $_.FullName }
}
Set-Alias vs Start-VisualStudioWithFirstSlnFile

function Get-CurrentRepoName(){
	$repoPath = git rev-parse --show-toplevel
	$repoName = basename $repoPath
	return $repoName
}

function Start-BitBucketAtCurrentRepo(){
	$repoName = Get-CurrentRepoName
	$url = "https://bitbucket.org/adbrain/" + $repoName + "/commits/all"
	Start-Process "chrome.exe" $url.ToLower()
}
Set-Alias bb Start-BitBucketAtCurrentRepo
