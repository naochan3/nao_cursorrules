# 🚀 Ohiro Cursor Rules (Solo Full-Stack Optimized)

このリポジトリは、Cursor AIエディタのための包括的なルールセットです。
ソロ開発者が「開発・デザイン・マーケティング・PM」の全領域をワンオペで高速かつ高品質に実行するために最適化されています。

## 🌟 特徴

- **フルスタック対応**: フロントエンド(React/Next.js)、バックエンド(Node.js/Supabase)、デザイン、マーケティングまで網羅。
- **ソロ開発最適化**: チーム開発のオーバーヘッド（承認フロー等）を排除し、CI/CDと自動化による高速ワークフローを実現。
- **最新技術スタック**: React 19, Next.js 15, Tailwind CSS v4, TypeScript 5対応。
- **デザインシステム**: 8pxグリッド、Bento Grid、心理学的デザイン原則（行動経済学）を統合。
- **GCP完全対応**: PowerShell対応の完全自動デプロイスクリプト完備。
- **ルールセレクター**: プロジェクトタイプに応じて必要なルールを自動選択する機能。

## 📁 ルール一覧

全てのルールファイルは `rules/` ディレクトリ内に格納されています。

| ファイル名 | 分類 | 概要 |
| :--- | :--- | :--- |
| `00-index.mdc` | 目次 | ルールのマスターインデックス |
| **`00-rule-selector.mdc`** | **メタルール** | **【最重要・常時適用】** プロジェクト開始時に必要なルールを自動判定し、プロジェクトフォルダにコピーするルールセレクター。 |
| `00-mindset.mdc` | 思考 | エンジニアとしての思考原則、AIとのコミュニケーションプロトコル |
| `01-design-system.mdc` | デザイン | 8pxグリッド、配色、タイポグラフィ、Bento Gridレイアウト |
| `02-environment-setup.mdc` | 環境 | PowerShell環境設定、日本語解説ルール |
| `03-git-github-workflow.mdc` | Git | ソロ開発用Gitフロー、コミット規約 |
| `04-frontend-basics.mdc` | FE | セマンティックHTML、モダンJS/TS、Tailwind CSS |
| `05-react-patterns.mdc` | FE | React 19, Next.js 15, FSDアーキテクチャ, Server Actions |
| `06-component-driven-development.mdc` | FE | コンポーネント駆動開発とStorybookの活用 |
| `07-nodejs-best-practices.mdc` | BE | Node.jsサーバー開発のルール、環境変数、エラーハンドリング |
| `08-supabase-rules.mdc` | BE | RLS、安全なクエリ、Supabaseセキュリティ |
| `09-integration-and-api-contracts.mdc` | BE | API連携、型定義、契約駆動開発 |
| `10-frontend-quality-assurance.mdc` | QA | デザインレビュー、レスポンシブ、アクセシビリティチェック |
| `11-code-hygiene-and-refactoring.mdc` | QA | ボーイスカウト・ルール、デッドコード削除、リファクタリング |
| `12-docker-best-practices.mdc` | QA | Dockerイメージ最適化、セキュリティ |
| `13-deployment-paas.mdc` | Deploy | Vercel/Railwayデプロイ、環境変数、ログ確認 |
| `14-scraping-rules.mdc` | Scraping | 倫理的なスクレイピング作法 |
| `15-project-memory.mdc` | Mgmt | 重要な決定や変更を記録する「短期記憶ログ」の作成 |
| `16-learning-documentation.mdc` | Mgmt | プロジェクトの「生きた教科書」を生成するルール |
| `17-static-to-dynamic-workflow.mdc` | Workflow | 静的コンテンツから動的アプリへの移行プロセス |
| `18-refactoring-and-path-consistency.mdc` | QA | リファクタリングとパス構造の一貫性維持 |
| `19-rule-usage-guide.mdc` | Meta | ルール活用ガイド、AIへの指示方法、タスク分類 |
| `20-gcp-deploy-complete-guide.mdc` | Deploy | GCP Cloud Runへの完全自動デプロイガイド (PowerShell対応) |
| `21-workflow-master.mdc` | Workflow | ソロ開発最適化ワークフロー |
| `22-tool-usage-policy.mdc` | Tool | AIツールの安全利用ポリシー |
| `23-security-policy.mdc` | Security | OWASP Top 10準拠セキュリティポリシー |
| `24-growth-marketing.mdc` | Biz | グロースハック、行動経済学、KPI設定 |
| `25-performance-tuning.mdc` | Perf | Core Web Vitals最適化、パフォーマンス予算 |

## 🚀 使い方

### 基本的な使い方

1. このリポジトリの `rules/` フォルダの中身を、あなたのプロジェクトの `.cursor/rules/` フォルダに配置してください。
2. `.cursorrules` ファイル（設定ファイル）を作成し、プロジェクトの特異性を定義します。
3. Cursorでチャットをする際、AIは自動的にこれらのルールを参照して回答します。

### ルールセレクターの使い方（推奨）

新しいプロジェクトを開始する際は、`00-rule-selector.mdc` を使用して必要なルールのみをプロジェクトにコピーすることを推奨します。

1. プロジェクトの性質（フロントエンドのみ/フルスタック/バックエンドのみ）を判定
2. デプロイ先（Vercel/GCP/その他）を決定
3. デザインタイプ（クリエイティブ/実用）を選択
4. ルールセレクターに従って必要なルールをコピー

詳細は `rules/00-rule-selector.mdc` を参照してください。

## 📄 ライセンス

MIT License
