# 🚀 Ohiro Cursor Rules (Solo Full-Stack Optimized)

このリポジトリは、Cursor AIエディタのための包括的なルールセットです。
ソロ開発者が「開発・デザイン・マーケティング・PM」の全領域をワンオペで高速かつ高品質に実行するために最適化されています。

## 🌟 特徴

- **フルスタック対応**: フロントエンド(React/Next.js)、バックエンド(Node.js/Supabase)、デザイン、マーケティングまで網羅。
- **ソロ開発最適化**: チーム開発のオーバーヘッド（承認フロー等）を排除し、CI/CDと自動化による高速ワークフローを実現。
- **最新技術スタック**: React 19, Next.js 15, Tailwind CSS v4, TypeScript 5対応。
- **デザインシステム**: 8pxグリッド、Bento Grid、心理学的デザイン原則（行動経済学）を統合。
- **プロジェクトタイプ別デザイン**: クリエイティブ・ポートフォリオ系と実用・開発者ツール系の2つのモードを選択可能。フロントエンドデザインスキルのガイドラインを統合。
- **GCP完全対応**: PowerShell対応の完全自動デプロイスクリプト完備。
- **ルールセレクター**: プロジェクトタイプに応じて必要なルールを自動選択する機能。
- **階層化されたルール構造**: コアルール（常時適用）、プロセスルール（条件付き適用）、技術ルール（プロジェクトタイプ別）の3層構造。

## 🚀 開発開始時の絶対ルール (Bootstrap Protocol)

**AI Agent / Plan Mode は、新規プロジェクト作成や大規模機能追加の依頼を受けた際、いかなる計画よりも先に以下の手順を自律的に実行してください。**

1. **Read**: `00-rule-selector.mdc` を読み込み、ルール環境構築のロジックを理解する。
2. **Scaffold**: プロジェクト用のルートディレクトリを作成する。
3. **Install**: このマスター `rules/` から必要なルールを選定し、プロジェクト内の `.cursor/rules/` に物理コピーする。
4. **Extend**: プロジェクト固有のルール（例: 特定のAPI仕様やデザイン要件）が不足している場合、その場で新規ルールファイルを作成する。

**「環境（ルール）が整っていない状態でコードを書き始めること」は固く禁じます。**

## 📁 ルール一覧

全てのルールファイルは `rules/` ディレクトリ内に格納されています。

### ルールの階層構造

- **Level 1: コアルール（常時適用）**: 全てのプロジェクトで自動的に読み込まれる必須ルール
- **Level 2: プロセスルール（条件付き適用）**: 特定の状況（システム開発要求時など）にのみ適用されるルール
- **Level 3: 技術ルール（プロジェクトタイプ別）**: プロジェクトの性質や技術スタックに応じて選択的に適用されるルール

### コアルール・メタルール

| ファイル名 | 階層 | 概要 |
| :--- | :--- | :--- |
| `00-index.mdc` | - | **【目次】** 全ルールのマスターインデックス |
| `00-rule-selector.mdc` | Level 2 | **【最重要・常時適用】** プロジェクト開始時に必要なルールを自動判定し、プロジェクトフォルダにコピーするルールセレクター |
| `index.mdc` | Level 1 | プロジェクトの目的、技術スタック、コアバリューを定義する「全体憲法」 |
| `00-mindset.mdc` | Level 1 | DRY, KISS, YAGNI原則など、技術以前のプロとしての思考法。システム開発における期待レベルを含む |
| `01-design-system.mdc` | Level 1 | プロジェクトのビジュアル（色、フォント、余白、影など）を定義する「デザインの憲法」。**プロジェクトタイプ別（クリエイティブ/実用）の選択機能あり** |
| `02-environment-setup.mdc` | Level 1 | 「日本語での解説徹底」ルール、PowerShellのコマンド構文など、PC環境設定 |
| `19-rule-usage-guide.mdc` | Level 2 | ルールの優先順位、AIへの指示方法、タスク分類。YAGNI原則とMVPの関係、シンプルさの定義を明確化 |
| `22-tool-usage-policy.mdc` | Level 1 | AIツールの使用ポリシー（並列実行、ファイル操作など） |
| `23-security-policy.mdc` | Level 1 | OWASP Top 10に基づくセキュリティポリシー |
| `26-implementation-process.mdc` | Level 2 | システム開発の実装プロセス。フェーズ1（要求分析と設計）を省略して実装を開始することは絶対に禁止。デザイン判断フレームワークを含む |
| `40-architecture-and-layering.mdc` | Level 1 | アプリケーションのレイヤリング、依存方向の原則 |

### フロントエンド開発

| ファイル名 | 階層 | 概要 |
| :--- | :--- | :--- |
| `03-git-github-workflow.mdc` | Level 3 | ソロ開発用Gitフロー、コミット規約 |
| `04-frontend-basics.mdc` | Level 3 | セマンティックHTML、モダンJS/TS、Tailwind CSS |
| `05-react-patterns.mdc` | Level 3 | React 19, Next.js 15, FSDアーキテクチャ, Server Actions |
| `06-component-driven-development.mdc` | Level 3 | コンポーネント駆動開発とStorybookの活用 |
| `10-frontend-quality-assurance.mdc` | Level 3 | デザインレビュー、レスポンシブ、アクセシビリティチェック |
| `38-forms-validation-and-error-ux.mdc` | Level 3 | フォームUX、バリデーションタイミング、エラー表示 |
| `39-layout-and-responsive-strategy.mdc` | Level 3 | ブレークポイント戦略、モバイル表示制御 |

### バックエンド開発

| ファイル名 | 階層 | 概要 |
| :--- | :--- | :--- |
| `07-nodejs-best-practices.mdc` | Level 3 | Node.jsサーバー開発のルール、環境変数、エラーハンドリング |
| `08-supabase-rules.mdc` | Level 3 | RLS、安全なクエリ、Supabaseセキュリティ |
| `09-integration-and-api-contracts.mdc` | Level 3 | API連携、型定義、契約駆動開発 |
| `34-data-modeling-and-naming.mdc` | Level 3 | DBテーブル設計、命名規則、マイグレーション運用 |

### AI・品質保証・パフォーマンス

| ファイル名 | 階層 | 概要 |
| :--- | :--- | :--- |
| `11-code-hygiene-and-refactoring.mdc` | Level 3 | ボーイスカウト・ルール、デッドコード削除、リファクタリング |
| `12-docker-best-practices.mdc` | Level 3 | Dockerイメージ最適化、セキュリティ |
| `25-performance-tuning.mdc` | Level 3 | Core Web Vitals、パフォーマンス予算、最適化戦略 |
| `27-testing-strategy.mdc` | Level 3 | プロダクトフェーズ（MVP/Stable）に応じたテスト戦略と自動化 |
| `28-observability-and-logging.mdc` | Level 3 | 構造化ログ、メトリクス、エラー追跡による可観測性確保 |
| `29-ai-product-rules.mdc` | Level 3 | AI機能実装時のプロンプト管理、安全性、品質基準 |
| `30-non-functional-requirements.mdc` | Level 3 | パフォーマンス、信頼性、セキュリティ等の非機能要件基準値 |

### デプロイ・インフラ

| ファイル名 | 階層 | 概要 |
| :--- | :--- | :--- |
| `13-deployment-paas.mdc` | Level 3 | Vercel/Railwayデプロイ、環境変数、ログ確認 |
| `20-gcp-deploy-complete-guide.mdc` | Level 3 | GCP Cloud Runへの完全自動デプロイガイド (PowerShell対応) |

### 要件定義・設計・モデリング

| ファイル名 | 階層 | 概要 |
| :--- | :--- | :--- |
| `31-product-vision-and-problem-framing.mdc` | Level 2 | ビジョン、課題定義、成功指標 (KPI) の明確化 |
| `32-functional-requirements-and-usecases.mdc` | Level 2 | ユーザーストーリー、受け入れ条件、ユースケース定義 |
| `33-domain-modeling-and-glossary.mdc` | Level 2 | ドメインモデル、用語集 (Ubiquitous Language) の統一 |
| `37-ux-research-and-ia.mdc` | Level 2 | 簡易UXリサーチ、画面遷移図、情報設計(IA) |

### プロジェクト管理・ワークフロー

| ファイル名 | 階層 | 概要 |
| :--- | :--- | :--- |
| `14-scraping-rules.mdc` | Level 3 | 倫理的なスクレイピング作法 |
| `15-project-memory.mdc` | Level 3 | 重要な決定や変更を記録する「短期記憶ログ」の作成 |
| `16-learning-documentation.mdc` | Level 3 | プロジェクトの「生きた教科書」を生成するルール |
| `17-static-to-dynamic-workflow.mdc` | Level 3 | 静的コンテンツから動的アプリへの移行プロセス |
| `18-refactoring-and-path-consistency.mdc` | Level 3 | リファクタリングとパス構造の一貫性維持 |
| `21-workflow-master.mdc` | Level 3 | ソロ開発最適化ワークフロー |
| `35-project-management-lite.mdc` | Level 2 | Issue管理、優先順位(P0-P3)、運用リズム |
| `36-code-review-guidelines.mdc` | Level 2 | レビュー観点、コメントラベル、心理的安全性 |

### ビジネス・マーケティング

| ファイル名 | 階層 | 概要 |
| :--- | :--- | :--- |
| `24-growth-marketing.mdc` | Level 3 | グロースハック、行動経済学、KPI設定 |

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

### プロジェクトタイプ別デザイン方針の選択

`01-design-system.mdc` では、プロジェクトの性質に応じて2つのデザインモードを選択できます：

- **クリエイティブ・ポートフォリオ系 (Creative Mode)**: ポートフォリオサイト、ブランドサイト、アート系プロジェクト向け。個性的なフォント、大胆なレイアウト、予想外の美的選択を推奨。
- **実用・開発者ツール系 (Functional Mode)**: ダッシュボード、管理画面、B2Bアプリ向け。効率と集中をテーマにした機能的デザイン、Inter Variable、Bento Gridを使用。

使用方法：

```
「@/.cursor/rules/01-design-system.mdc のクリエイティブモード（セクション10）に従って、ポートフォリオサイトのデザインを作って」
```

## 📄 ライセンス

MIT License
