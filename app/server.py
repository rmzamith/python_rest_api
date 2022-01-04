#!/usr/bin/env python
import os

from http import HTTPStatus
from connexion import App

app = App(__name__, specification_dir="./spec", options={"swagger_ui": True})
application = app.app
app. add_api("my_app.yml", strict_validation=True)

@app.route("/")
def home():
    return {"status": "Running"}, HTTPStatus.OK

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=os.environ.get("FLASK_SERVER_PORT", 8002), debug=True)