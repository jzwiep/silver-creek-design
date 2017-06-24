.DEFAULT_TARGET: help

STACK_NAME="SilverCreekDesignWebsite"
DOMAIN_NAME="www.silvercreekdesign.ca"

help:	## Show this help message
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'

sync-www:	## Sync the local 'www' directory with the hosting S3 bucket
	aws s3 sync www/ s3://${DOMAIN_NAME}/ --delete

create-bucket:	## Create the S3 hosting bucket
	aws cloudformation create-stack \
		--stack-name ${STACK_NAME} \
		--template-body file://./infra/s3-static-website.yml \
		--parameters ParameterKey=FullDomainName,ParameterValue=${DOMAIN_NAME}

delete-bucket:	## Remove the S3 hosting bucket (deleting any files still in the bucket)
	aws s3 rm s3://${DOMAIN_NAME} --recursive
	aws cloudformation delete-stack --stack-name ${STACK_NAME}