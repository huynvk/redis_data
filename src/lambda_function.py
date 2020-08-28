import redis
import os

def lambda_handler(*args, **kwargs):
    redis_url = os.environ.get('REDIS_URL', '192.168.1.10')
    redis_port = os.environ.get('REDIS_PORT', '6379')
    r = redis.Redis(host=redis_url, port=redis_port, db=0)
    for key in r.scan_iter("*"):
        print(key)
        print(r.get(key)) 