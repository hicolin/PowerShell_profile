Import-Module DirColors
Import-Module posh-git
Import-Module oh-my-posh
Import-Module git-aliases -DisableNameChecking
Set-Theme Paradox

# Import the Chocolatey Profile that contains the necessary code to enable
# tab-completions to function for `choco`.
# Be aware that if you are missing these lines from your profile, tab completion
# for `choco` will not function.
# See https://ch0.co/tab-completion for details.
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}

# oh-my-posh
# https://ohmyposh.dev/docs/themes
# oh-my-posh init pwsh --config $env:POSH_THEMES_PATH\material.omp.json | Invoke-Expression
# oh-my-posh init pwsh --config $env:POSH_THEMES_PATH\robbyrussell.omp.json | Invoke-Expression
# oh-my-posh init pwsh --config $env:POSH_THEMES_PATH\ys.omp.json | Invoke-Expression

# PSReadLine
Set-PSReadLineOption -PredictionSource History # 设置预测文本来源为历史记录
Set-PSReadlineKeyHandler -Key Tab -Function ForwardChar # 设置 Tab 键补全
Set-PSReadlineKeyHandler -Key RightArrow -Function Complete # 设置 → 列出所有命令
Set-PSReadLineKeyHandler -Key "Ctrl+d" -Function MenuComplete # 设置 Ctrl+d 为菜单补全和 Intellisense
Set-PSReadLineKeyHandler -Key "Ctrl+z" -Function Undo # 设置 Ctrl+z 为撤销
Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward # 设置向上键为后向搜索历史记录
Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward # 设置向下键为前向搜索历史纪录

# starship
Invoke-Expression (&starship init powershell)
$ENV:STARSHIP_CONFIG = "$HOME\.config\starship\starship.toml"
