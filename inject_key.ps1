# inject_key.ps1
[CmdletBinding()]
param(
  [string]$EnvFile = ".env",
  [string]$Template  = "web\index.html.template",
  [string]$Output    = "web\index.html"
)

# Читаем .env
if (-Not (Test-Path $EnvFile)) {
  Write-Error ".env not found!"
  exit 1
}
$lines = Get-Content $EnvFile | Where-Object { $_ -match "=" }
$dict  = @{}
foreach ($line in $lines) {
  $parts = $line -split "=", 2
  $dict[$parts[0].Trim()] = $parts[1].Trim()
}

if (-Not $dict.ContainsKey("GOOGLE_MAPS_API_KEY")) {
  Write-Error "GOOGLE_MAPS_API_KEY not defined in .env"
  exit 1
}
$key = $dict["GOOGLE_MAPS_API_KEY"]

# Инжектим в шаблон
(Get-Content $Template) `
  -replace "%GOOGLE_MAPS_API_KEY%", $key `
  | Set-Content $Output

Write-Host "✅ Сгенерирован web/index.html с ключом"
