require 'aws-sdk-dynamodb'

Aws.config.update({
  region: ENV.fetch("AWS_REGION", "us-east-1"),
  credentials: Aws::Credentials.new(
    ENV.fetch("AWS_ACCESS_KEY_ID", "fakeMyKeyId"),
    ENV.fetch("AWS_SECRET_ACCESS_KEY", "fakeSecretAccessKey")
  )
})

DYNAMODB_CLIENT = Aws::DynamoDB::Client.new
