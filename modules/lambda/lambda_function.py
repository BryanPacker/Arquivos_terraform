import boto3
import json
from datetime import datetime

def lambda_handler(event, context):
    s3 = boto3.client('s3')
    bucket_name = 'proway-s3-putArchive-bryan-22/09'
    file_name = datetime.now().strftime('%Y%m%d_%H%M%S') + 'bryanex4legal.txt'    
    content = event['Records'][0]['Sns']['Message'] if 'Records' in event else 'Teste local'
    retorno = None
    print('Iniciando...')
    try:
        retorno = s3.put_object(
            Bucket=bucket_name,
            Key=file_name,
            Body=content
        )
        print('OK')
    except Exception as e:
        print(e)
    finally:
        return {
            'statusCode': 200 if retorno else 500,
            'body': json.dumps(('Success' if retorno else 'Error') +' creating file in S3')
        }