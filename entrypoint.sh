#!/bin/sh

# Deploy the template using the SAM CLI
secret_id="$1"
lambda_arn="$2"
cron_expr="$3"

echo "Secret Rotation started.."
aws secretsmanager rotate-secret --secret-id ${secret_id} --rotation-lambda-arn ${lambda_arn} --rotate-immediately
	
#    --rotation-rules "{\"ScheduleExpression\": \"cron(0 16 1,15 * ? *)\", \"Duration\": \"2h\"}"
	
if [ $? -ne 0 ]; then
  echo "Secret Rotation error"
  exit 1
fi

