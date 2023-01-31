#!/bin/sh

# Deploy the template using the SAM CLI
secret-id="$1"
lambda="$2"
cron_expr="$3"


aws sts get-caller-identity --query "Account" --output text

echo "Secret Rotation started.."
aws secretsmanager rotate-secret --secret-id ${secret-id} --rotation-lambda-arn ${lambda} --rotate-immediately --region 'us-east-1'
	
#    --rotation-rules "{\"ScheduleExpression\": \"cron(0 16 1,15 * ? *)\", \"Duration\": \"2h\"}"
	
if [ $? -ne 0 ]; then
  echo "Secret Rotation error"
  exit 1
fi

