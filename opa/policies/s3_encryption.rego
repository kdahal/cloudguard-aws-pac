package aws.s3.encryption

deny[reason] {
  input.resource_type == "aws_s3_bucket"
  not input.configuration.ServerSideEncryptionConfiguration
  reason := sprintf("Bucket %s does not have server-side encryption enabled.", [input.resource_name])
}
