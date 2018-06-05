from flask import Flask, render_template, request
import os

app = Flask(__name__)
server_name = os.getenv('HOSTNAME')

if os.path.isfile('/run/secrets/secret'):
   open('/run/secrets/secret', 'r')
   title = open('/run/secrets/secret', 'r')
   red_secret = title.read()
   title.close
else:
   red_secret = 'You should really use secrets.'

@app.route('/info')
def info(server_name=None):
    server_name = os.getenv('HOSTNAME')
    return server_name + ' : 0.1', 200

@app.route('/secret')
def secret():
    return red_secret

@app.route('/')
def index(server_name=None):
    server_name = os.getenv('HOSTNAME')
    item_doc = {
        'ip': request.remote_addr
    }
    return render_template('index.html', server_name=server_name, secret=red_secret)

if __name__ == '__main__':
    app.run(host='0.0.0.0')
