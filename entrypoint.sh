#!/bin/sh

# Deploy the template using the SAM CLI
secret-id="$1"
lambda="$2"
cron_expr="$3"

export AWS_ACCESS_KEY_ID=AKIAT7NSVCSAWAPRXGRN
export AWS_SECRET_ACCESS_KEY=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
export AWS_DEFAULT_REGION=us-east-1

aws sts get-caller-identity --query "Account" --output text

echo "Secret Rotation started.."
aws secretsmanager rotate-secret --secret-id ${secret-id} --rotation-lambda-arn ${lambda} --rotate-immediately
	
#    --rotation-rules "{\"ScheduleExpression\": \"cron(0 16 1,15 * ? *)\", \"Duration\": \"2h\"}"
	
if [ $? -ne 0 ]; then
  echo "Secret Rotation error"
  exit 1
fi

