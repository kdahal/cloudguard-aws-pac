import boto3

def list_s3_buckets():
    s3 = boto3.client('s3')
    response = s3.list_buckets()
    return [b['Name'] for b in response.get('Buckets', [])]
