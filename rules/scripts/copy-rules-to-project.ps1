<#
.SYNOPSIS
プロジェクトフォルダに必要なルールをコピーするスクリプト

.DESCRIPTION
ルールセレクター（00-rule-selector.mdc）に基づいて、プロジェクトタイプに応じた必要なルールをプロジェクトフォルダにコピーします。

.PARAMETER ProjectPath
プロジェクトフォルダのパス（必須）

.PARAMETER ProjectType
プロジェクトタイプ: "frontend", "fullstack", "backend", "infra"（必須）

.PARAMETER DeployTarget
デプロイ先: "vercel", "gcp", "railway", "none"（オプション、デフォルト: "none"）

.PARAMETER DesignType
デザインタイプ: "creative", "functional"（オプション、デフォルト: "functional"）

.EXAMPLE
.\copy-rules-to-project.ps1 -ProjectPath "C:\Projects\my-app" -ProjectType "frontend" -DeployTarget "vercel" -DesignType "creative"
#>

param(
    [Parameter(Mandatory=$true)]
    [string]$ProjectPath,
    
    [Parameter(Mandatory=$true)]
    [ValidateSet("frontend", "fullstack", "backend", "infra")]
    [string]$ProjectType,
    
    [Parameter(Mandatory=$false)]
    [ValidateSet("vercel", "gcp", "railway", "none")]
    [string]$DeployTarget = "none",
    
    [Parameter(Mandatory=$false)]
    [ValidateSet("creative", "functional")]
    [string]$DesignType = "functional"
)

$ErrorActionPreference = "Stop"

# カラー出力関数
function Write-Color($Text, $Color) {
    Write-Host $Text -ForegroundColor $Color
}

# ルールのベースパス
$RulesBasePath = Join-Path $PSScriptRoot ".."
$TargetRulesPath = Join-Path $ProjectPath ".cursor" "rules"

# 必須ルール（全プロジェクト共通）
$RequiredRules = @(
    "00-mindset.mdc",
    "02-environment-setup.mdc",
    "22-tool-usage-policy.mdc",
    "23-security-policy.mdc"
)

# プロジェクトタイプ別ルール
$TypeRules = @{
    "frontend" = @(
        "01-design-system.mdc",
        "04-frontend-basics.mdc",
        "05-react-patterns.mdc",
        "10-frontend-quality-assurance.mdc"
    )
    "fullstack" = @(
        "01-design-system.mdc",
        "04-frontend-basics.mdc",
        "05-react-patterns.mdc",
        "07-nodejs-best-practices.mdc",
        "08-supabase-rules.mdc",
        "09-integration-and-api-contracts.mdc",
        "10-frontend-quality-assurance.mdc",
        "12-docker-best-practices.mdc"
    )
    "backend" = @(
        "07-nodejs-best-practices.mdc",
        "08-supabase-rules.mdc",
        "09-integration-and-api-contracts.mdc",
        "12-docker-best-practices.mdc"
    )
    "infra" = @(
        "12-docker-best-practices.mdc",
        "20-gcp-deploy-complete-guide.mdc"
    )
}

# デプロイ先別ルール
$DeployRules = @{
    "vercel" = @("13-deployment-paas.mdc")
    "gcp" = @("20-gcp-deploy-complete-guide.mdc")
    "railway" = @("13-deployment-paas.mdc")
    "none" = @()
}

# 推奨ルール（オプション）
$RecommendedRules = @(
    "11-code-hygiene-and-refactoring.mdc",
    "25-performance-tuning.mdc"
)

Write-Color "🚀 ルールコピー開始" "Cyan"
Write-Color "プロジェクトパス: $ProjectPath" "Yellow"
Write-Color "プロジェクトタイプ: $ProjectType" "Yellow"
Write-Color "デプロイ先: $DeployTarget" "Yellow"
Write-Color "デザインタイプ: $DesignType" "Yellow"
Write-Host ""

# ターゲットディレクトリの作成
if (-not (Test-Path $TargetRulesPath)) {
    Write-Color "📁 ディレクトリ作成: $TargetRulesPath" "Yellow"
    New-Item -ItemType Directory -Path $TargetRulesPath -Force | Out-Null
}

# コピーするルールリストを作成
$RulesToCopy = @()
$RulesToCopy += $RequiredRules
$RulesToCopy += $TypeRules[$ProjectType]
$RulesToCopy += $DeployRules[$DeployTarget]

# 重複を除去
$RulesToCopy = $RulesToCopy | Select-Object -Unique

# ルールをコピー
$CopiedRules = @()
$FailedRules = @()

foreach ($rule in $RulesToCopy) {
    $SourcePath = Join-Path $RulesBasePath $rule
    $TargetPath = Join-Path $TargetRulesPath $rule
    
    if (Test-Path $SourcePath) {
        try {
            Copy-Item -Path $SourcePath -Destination $TargetPath -Force
            Write-Color "  ✅ $rule" "Green"
            $CopiedRules += $rule
        }
        catch {
            Write-Color "  ❌ $rule (エラー: $_)" "Red"
            $FailedRules += $rule
        }
    }
    else {
        Write-Color "  ⚠️  $rule (ファイルが見つかりません)" "Yellow"
        $FailedRules += $rule
    }
}

# RULES_USED.md を作成
$RulesUsedContent = @"
# 使用ルール一覧

## プロジェクト情報
- **プロジェクトパス**: $ProjectPath
- **プロジェクトタイプ**: $ProjectType
- **デプロイ先**: $DeployTarget
- **デザインタイプ**: $DesignType
- **コピー日時**: $(Get-Date -Format "yyyy-MM-dd HH:mm:ss")

## 必須ルール（全プロジェクト共通）
$($RequiredRules | ForEach-Object { "- $_" } | Out-String)

## プロジェクトタイプ別ルール
$($TypeRules[$ProjectType] | ForEach-Object { "- $_" } | Out-String)

## デプロイ先別ルール
$($DeployRules[$DeployTarget] | ForEach-Object { "- $_" } | Out-String)

## 推奨ルール（オプション）
$($RecommendedRules | ForEach-Object { "- $_ (未コピー)" } | Out-String)

## コピー結果
- **成功**: $($CopiedRules.Count) ファイル
- **失敗**: $($FailedRules.Count) ファイル

## 次のステップ
1. プロジェクト固有のルールが必要な場合は、`.cursor/rules/` フォルダに追加してください
2. ファイル名は `XX-project-specific-[名前].mdc` 形式で作成してください
3. プロジェクト完了後は、汎用的なルールをメインルールに統合するか判断してください
"@

$RulesUsedPath = Join-Path $ProjectPath "RULES_USED.md"
Set-Content -Path $RulesUsedPath -Value $RulesUsedContent -Encoding UTF8

Write-Host ""
Write-Color "✅ ルールコピー完了" "Green"
Write-Color "コピーしたルール: $($CopiedRules.Count) ファイル" "Green"
Write-Color "RULES_USED.md を作成しました: $RulesUsedPath" "Green"

if ($FailedRules.Count -gt 0) {
    Write-Host ""
    Write-Color "⚠️ コピーに失敗したルール:" "Yellow"
    $FailedRules | ForEach-Object { Write-Color "  - $_" "Yellow" }
}

Write-Host ""
Write-Color "📝 次のステップ:" "Cyan"
Write-Color "1. プロジェクトフォルダの .cursor/rules/ を確認してください" "White"
Write-Color "2. 必要に応じてプロジェクト固有のルールを追加してください" "White"
Write-Color "3. 開発を開始してください" "White"

