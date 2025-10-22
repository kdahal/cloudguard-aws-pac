package aws.s3.encryption

test_deny_unencrypted_bucket {
  input := {
    "resource_type": "aws_s3_bucket",
    "resource_name": "unencrypted-bucket",
    "configuration": {}
  }
  deny[reason] with input as input
}
