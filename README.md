## ※まだ作成中
- ハードコーディング部分が多いので、変数化を検討中

## 前提
- AWS CLI がインストール済であり、適切なアクセス権限をもつIAMアカウントを設定済であること
- Terraform CLI がインストール済であること

## tdstateファイルを永続化するためのS3バケットを作成

```
# S3バケットの作成
aws s3api create-bucket --bucket tf-cicd-ecr --create-bucket-configuration LocationConstraint=ap-northeast-1

# バージョニング設定
aws s3api put-bucket-versioning --bucket tf-cicd-ecr --versioning-configuration Status=Enabled

# 暗号化
aws s3api put-bucket-encryption --bucket tf-cicd-ecr --server-side-encryption-configuration '{
"Rules":[
    {
      "ApplyServerSideEncryptionByDefault": {
        "SSEAlgorithm": "AES256"
      }
    }
  ]
}'

# パブリックアクセスのブロック
aws s3api put-public-access-block --bucket tf-cicd-ecr \
--public-access-block-configuration '{
  "BlockPublicAcls"       : true,
  "BlockPublicPolicy"     : true,
  "IgnorePublicAcls"      : true,
  "RestrictPublicBuckets" : true
}'

## S3作成は Cloudformation化 するのもよいかも
```

## Terraform の初期セットアップ

```
# 初期セットアップ
terraform init

# 変更箇所の確認
terraform plan

# 変更箇所のリリース
terraform apply

# 設定した出力内容の確認
terraform output

# リリース内容の確認
terraform show
```
