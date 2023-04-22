# ReaDiaryの概要

ReaDiaryは読書記録を管理し、感想を共有するサービスです。
Web上でも好きな本の話で盛り上がれるような場所を提供するという
モチベーションで作成しました。

# URL

https://readiary.net
<br>
ゲストログイン機能あり

# 実装機能一覧

### メイン機能

- 書籍の登録
	
	- 書籍の検索（Google Books API）
	
	- 書籍の登録(Vue.js)

- 読書記録の管理

	- 記録の更新、削除（Hotwire)
	
	- 感想、レビューの投稿機能(Hotwire)

- 感想・レビューのタイムライン

	- 感想・レビューへの返信機能
	
### ユーザー関連

- ユーザーの登録、ログイン機能、ゲストログイン機能(devise)
		
	- プロフィール画像の設定（Activestorage)
		
	- ユーザー情報の編集機能
	
- ユーザー間でのフォロー、フォロワー機能（Hotwire)
	
### その他

 - Github Actionsを用いた自動デプロイ機能
 
 - Terraformを用いたインフラのコード化

# 使用技術

### バックエンド

- Ruby 3.1.2
	
- Rails 7.0.4

- Puma
	
- MySQL 5.7
	
### フロントエンド

- Sass
	
- Bootstrap
	
- jQuery
	
- Vue.js
	
### インフラ

- Docker, docker-compose
	
- Github Actions
	
- AWS(ECS, FARGATE, RDS, VPC, Route53, ALB, ACM, cloudWatch)
	
- terraform
	
### その他

- Google Books API
 
# インフラ構成図

 ![名称未設定ファイル drawio](https://user-images.githubusercontent.com/109674750/233789580-8ae3d775-0297-497e-8597-df5ef3ce0192.svg)

 
