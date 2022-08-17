from flask import Flask

import index
import adan
import os

app = Flask(__name__)

@app.route("/")
def hello_world():
    return "<p>{}, {}!</p>".format(index.get_hello(), index.get_world())


@app.route("/adan")
def adan_route():
    return "<h1>{}<h1>".format(adan.get_message())

def main() -> None:
    print("{} {}".format(index.get_hello(), index.get_world()))

if __name__ == '__main__':
    port = int(os.environ.get('PORT', 5000))
    app.run(debug=True, host='0.0.0.0', port=port)