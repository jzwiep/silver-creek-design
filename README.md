# Silver Creek Design

Company website for [Silver Creek Design](www.silvercreekdesign.ca) -- a static website made with Bootstrap and hosted in Amazon's S3.

## Manage the Hosting

### Requirements

* An AWS account w/ CFN and S3 permissions
* AWS CLI installed w/ auth configured

### Creating the bucket

Creates a static web hosting bucket with proper ACLs via AWS CloudFormation

```
make create-bucket
```

### Updating the website files

Syncs files from the local `www/` directory to the S3 bucket

```
make sync-www
```

### Cleaning up the bucket

Deletes all the files from the hosting bucket, then deletes the S3 bucket by deleting the CloudFormation stack.

```
make delete-bucket
```

## DNS Configuration

To keep things inexpensive, I used NameCheap to manage the domain. To point the domain to the S3 bucket, I added two records to the DNS config:
```
CNAME Record      www   domain.com.s3-website-us-west-2.amazonaws.com.
Redirect Record   @     http://www.domain.com   Permanent(301)
```
* `CNAME` from `www` to the S3 bucket
* URL Redirection from the root domain to the `www` domain