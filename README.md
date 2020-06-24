
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
