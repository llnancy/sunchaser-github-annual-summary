#!/usr/bin/env python
# -*- coding: utf-8 -*-
import uuid

from flask import Flask, abort, request, jsonify
from annual_report import AnnualReport
from wsgiref.simple_server import make_server
from flask_cors import CORS
 
app = Flask(__name__,static_folder="static", static_url_path="/static")
CORS(app, supports_credentials=True)
 
@app.route('/github',methods=["GET"])
def hello_world():
    github_id = request.args.get("github_id")
    print(github_id)
    ar = AnnualReport(github_id=github_id)
    if not ar.check_user_data():
        return '该GitHub用户不存在'
    else:
        image = ar.draw()
        uuidstr = uuid.uuid1()
        img_path = './static/img/' + str(uuidstr) + 'tmp.png'
        image.save(img_path)
        return jsonify({'img_path': img_path})

if __name__ == '__main__':
    server = make_server('0.0.0.0',520,app)
    server.serve_forever()
    app.run()