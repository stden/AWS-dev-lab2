set myBucket=notes-bucket-734328061
aws s3api put-public-access-block --bucket "%myBucket%" --public-access-block-configuration "BlockPublicPolicy=false,RestrictPublicBuckets=false"
aws s3api put-bucket-website --bucket "%myBucket%" --website-configuration file://html/website.json
aws s3api put-bucket-policy --bucket "%myBucket%" --policy file://html/policy.json
aws s3 sync html s3://"%myBucket%"
@echo Task 4.3: Test your website
set region=ap-southeast-2
echo You can now access the website using the following URL... 
echo http://%myBucket%.s3-website-%region%.amazonaws.com