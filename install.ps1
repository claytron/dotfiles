#Requires -Version 5.1
$ErrorActionPreference = "Stop"

# Require admin: choco installs system-wide, and some winget packages also need elevation.
$principal = [Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()
if (-not $principal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Write-Host "This script must be run from an elevated PowerShell (Run as Administrator)." -ForegroundColor Red
    Read-Host "Press Enter to exit"
    exit 1
}

Write-Host "Bootstrapping dotfiles via chezmoi..." -ForegroundColor Green

# Pick a package manager: prefer winget (preinstalled on Windows 10/11), fall back to
# Chocolatey (needed on Windows Server 2022 and other systems without winget).
function Install-Chocolatey {
    Write-Host "Installing Chocolatey..." -ForegroundColor Yellow
    Set-ExecutionPolicy Bypass -Scope Process -Force
    [System.Net.ServicePointManager]::SecurityProtocol =
        [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
    Invoke-Expression ((New-Object System.Net.WebClient).DownloadString(
        'https://community.chocolatey.org/install.ps1'))
    $env:PATH = [System.Environment]::GetEnvironmentVariable("PATH", "Machine") + ";" +
                [System.Environment]::GetEnvironmentVariable("PATH", "User")
}

if (Get-Command winget -ErrorAction SilentlyContinue) {
    $pm = "winget"
} else {
    if (-not (Get-Command choco -ErrorAction SilentlyContinue)) { Install-Chocolatey }
    $pm = "choco"
}

# True if any installed app's DisplayName matches the pattern (covers both per-user
# and machine-wide MSI/EXE installers — needed because choco doesn't install MSIX).
function Test-InstalledApp {
    param([string]$DisplayNamePattern)
    $keys = @(
        'HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\*',
        'HKLM:\Software\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\*',
        'HKCU:\Software\Microsoft\Windows\CurrentVersion\Uninstall\*'
    )
    [bool](Get-ItemProperty $keys -ErrorAction SilentlyContinue |
        Where-Object { $_.DisplayName -like $DisplayNamePattern })
}
Write-Host "Using package manager: $pm" -ForegroundColor Green

# Install required tools if missing.
# 1Password (GUI) provides the SSH agent used to clone the repo.
$tools = @(
    @{
        Name = "1Password"
        Winget = "AgileBits.1Password"
        Choco = "1password"
        Check = {
            [bool](Get-AppxPackage -Name 'Agilebits.1Password' -ErrorAction SilentlyContinue) -or
            (Test-InstalledApp '1Password*')
        }
    }
    @{
        Name = "1Password CLI"
        Winget = "AgileBits.1Password.CLI"
        Choco = "1password-cli"
        Check = { [bool](Get-Command op -ErrorAction SilentlyContinue) }
    }
    @{
        Name = "git"
        Winget = "Git.Git"
        Choco = "git"
        Check = { [bool](Get-Command git -ErrorAction SilentlyContinue) }
    }
    @{
        Name = "chezmoi"
        Winget = "twpayne.chezmoi"
        Choco = "chezmoi"
        Check = { [bool](Get-Command chezmoi -ErrorAction SilentlyContinue) }
    }
    @{
        Name = "PowerShell"
        Winget = "Microsoft.PowerShell"
        Choco = "powershell-core"
        Check = { [bool](Get-Command pwsh -ErrorAction SilentlyContinue) }
    }
    @{
        Name = "gsudo"
        Winget = "gerardog.gsudo"
        Choco = "gsudo"
        Check = { [bool](Get-Command gsudo -ErrorAction SilentlyContinue) }
    }
)

$opJustInstalled = $false
foreach ($tool in $tools) {
    if (-not (& $tool.Check)) {
        Write-Host "Installing $($tool.Name)..." -ForegroundColor Yellow
        if ($pm -eq "winget") {
            winget install --exact --silent `
                --accept-package-agreements --accept-source-agreements `
                --source winget $tool.Winget
        } else {
            choco install -y $tool.Choco
        }
        if ($tool.Name -eq "1Password") { $opJustInstalled = $true }
    }
}

# A fresh 1Password install needs sign-in + SSH agent toggle before the git clone will succeed.
if ($opJustInstalled) {
    Write-Host ""
    Write-Host "Open 1Password, sign in, then enable Settings -> Developer -> 'Use the SSH agent'." -ForegroundColor Yellow
    Write-Host "Re-run this script once that's done." -ForegroundColor Yellow
    Read-Host "Press Enter to exit"
    exit 0
}

# Refresh PATH so newly-installed binaries are visible in this session.
$env:PATH = [System.Environment]::GetEnvironmentVariable("PATH", "Machine") + ";" +
            [System.Environment]::GetEnvironmentVariable("PATH", "User")

Write-Host "Running chezmoi init..." -ForegroundColor Green

# Use Windows OpenSSH so the 1Password SSH agent (a named pipe) is reachable.
# Git for Windows' bundled MSYS ssh can't talk to Windows named pipes, and
# chezmoi's built-in go-git can't either — so force system git for the clone.
$winSsh = "$env:WINDIR\System32\OpenSSH\ssh.exe"
if (Test-Path $winSsh) {
    $env:GIT_SSH_COMMAND = "`"$winSsh`""
}

chezmoi init --apply --ssh --use-builtin-git=false claytron
