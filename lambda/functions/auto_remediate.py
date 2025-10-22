import boto3
import json
import logging

logger = logging.getLogger()
logger.setLevel(logging.INFO)

def enable_bucket_encryption(bucket_name):
    s3 = boto3.client('s3')
    try:
        s3.put_bucket_encryption(
            Bucket=bucket_name,
            ServerSideEncryptionConfiguration={
                'Rules': [{'ApplyServerSideEncryptionByDefault': {'SSEAlgorithm': 'AES256'}}]
            }
        )
        logger.info(f"Enabled encryption for {bucket_name}")
        return True
    except Exception as e:
        logger.error(f"Failed to enable encryption for {bucket_name}: {e}")
        return False

def lambda_handler(event, context):
    logger.info(f"Received event: {json.dumps(event)}")
    bucket_name = event.get("detail", {}).get("resourceName")
    if bucket_name:
        success = enable_bucket_encryption(bucket_name)
        return {"bucket": bucket_name, "status": "remediated" if success else "failed"}
    return {"error": "No bucket name provided"}
