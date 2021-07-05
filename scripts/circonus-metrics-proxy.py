import requests
"""
this is a WSGI (python3) metrics proxy to connect herp-derp to Circonus
you can use this as a template to process these locally or send to another
metrics sink/monitoring stack of your choosing
"""

# replace with your httptrap URL, which you can find in the check definition
circonus_url = 'https://api.circonus.com/module/httptrap/.../...'

def application(environ, start_response):
    method = environ.get('REQUEST_METHOD')
    data = environ.get('wsgi.input').read()

    if method == 'PUT':
        response = requests.put(circonus_url, data=data)
        status = f'{response.status_code} {response.reason}'
        body = response.content
    else:
        status = f'405 Method Not Allowed'
        body = f'null'.encode('utf-8')

    response_header = [('Content-type','application/json')]
    start_response(status, response_header)

    return [body]

