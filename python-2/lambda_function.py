import json
import boto3
import logging

logger = logging.getLogger()
logger.setLevel(logging.INFO)

def lambda_handler(event, context):
    logger.info('HelloWorld from Python Lambda!')
    return {
        'statusCode': 200,
        'body': json.dumps('HelloWorld from Python Lambda!')
    }
