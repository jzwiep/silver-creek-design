# Silver Creek Design

Company site for [Silver Creek Design](www.silvercreekdesign.ca) -- a static website made with Bootstrap and hosted in Amazon's S3.

## Deploying

### Requirements

* An AWS account w/ CF and S3 permissions
* AWS CLI installed w/ auth configured

### Manage the Hosting

The static site is served from a S3 bucket. All management: creating the bucket, updating the site files, and deleting the bucket can be done easily via the project's `Makefile`. 

Run `make help` for details on each of the available targets.

## DNS Configuration

To keep things inexpensive, I used NameCheap's free service to manage the domain. To point the domain to the S3 bucket, I added two records to the DNS config:
```
CNAME Record      www   domain.com.s3-website-us-west-2.amazonaws.com.
Redirect Record   @     http://www.domain.com   Permanent(301)
```
* `CNAME` from `www` to the S3 bucket
* URL Redirection from the root domain to the `www` domain