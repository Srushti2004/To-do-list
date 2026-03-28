#!/bin/bash

# VARIABLES
BUCKET_NAME="srushti-todo-app-$(date +%s)"
REGION="ap-south-1"

echo "Creating S3 bucket: $BUCKET_NAME"

# Create bucket
aws s3 mb s3://$BUCKET_NAME --region $REGION

# Disable block public access
aws s3api put-public-access-block \
  --bucket $BUCKET_NAME \
  --public-access-block-configuration \
  BlockPublicAcls=false,IgnorePublicAcls=false,BlockPublicPolicy=false,RestrictPublicBuckets=false

# Enable static website hosting
aws s3 website s3://$BUCKET_NAME/ \
  --index-document index.html

# Upload files
aws s3 sync . s3://$BUCKET_NAME

# Add bucket policy
cat > policy.json <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "PublicRead",
      "Effect": "Allow",
      "Principal": "*",
      "Action": "s3:GetObject",
      "Resource": "arn:aws:s3:::$BUCKET_NAME/*"
    }
  ]
}
EOF

aws s3api put-bucket-policy \
  --bucket $BUCKET_NAME \
  --policy file://policy.json

# Output website URL
echo "====================================="
echo "Your website is live at:"
echo "http://$BUCKET_NAME.s3-website-$REGION.amazonaws.com"
echo "====================================="
