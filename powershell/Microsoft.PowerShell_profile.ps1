# load chocoal
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}

# Use these profile items not in vscode
if ($env:TERM_PROGRAM -ne 'vscode') {
  Import-Module -Name MyHelper -WarningAction SilentlyContinue
  # ...
  # ...
}

# redirect git stderr output. This is needed use git commands in powershell.
# Some commands do there outut into stderr instead of stdout. / git clone.
$env:GIT_REDIRECT_STDERR = '2>&1'

# Config Electron npm package to use the proxy
$Env:ELECTRON_GET_USE_PROXY = $true
# proxy settings for http/https agent 
$Env:GLOBAL_AGENT_HTTPS_PROXY = 'https://a.b.c.d:3128/'

Import-Module -Name 'PSReadline'

# import git auto completion
Import-Module -Name 'posh-git'

# import starship prompt
Invoke-Expression (&starship init powershell)

# import auto completion for tea (gitea client)
& C:\Users\wkiv924\AppData\Local\tea\tea.ps1
