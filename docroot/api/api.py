import json
import db as db
import trigger
import Users as users
import requests
from flask import Flask, jsonify, request, render_template, redirect, url_for, flash
from wtforms import Form, BooleanField, StringField, PasswordField, validators
from flask_restful import Resource, Api
from flask_cors import CORS

app = Flask(__name__)
app.secret_key = b'_5#y2L"F4Q8z\n\xec]/'
app.config['CORS_HEADERS'] = 'Content-Type'
app.config['DEBUG'] = True

cors = CORS(app, resources={r"/api/*": {"origins": "*"}})

class ValidatorForm(Form):
    github_username = StringField('Github Username')
    email = StringField('Email Address')
    activation_key = StringField('Activation key')
    github_repo = StringField('Github Repository')

def validate_github(github_username, email, key, github_repo):
    # Mock repo: 'https://api.github.com/repos/ayushjain10/MockRepo'
    url = "https://api.github.com/repos/{}/{}/branches".format(github_username, github_repo)
    resp = requests.get(url, headers={"authorization": "token " + key, "Accept": "application/vnd.github.squirrel-girl-preview+json"})
    if resp.status_code != 200:
        return None
    else:
        return resp.json()

@app.route('/processing')
def processing():
  return 'Processing'

@app.route('/', methods=['GET', 'POST'])
def register():
    form = ValidatorForm(request.form)
    if request.method == 'POST':
        result = validate_github(form.github_username.data, form.email.data, form.activation_key.data, form.github_repo.data)
        if result == None:
            flash('Please enter correct credentials !!!')
        else:
            flash('Processing........')
            # Save all details in DB.
            val = [form.github_username.data, form.email.data, form.activation_key.data, form.github_repo.data]
            db_obj = db.DatabaseOperation()
            db_obj.usersInsert(val)

            # =========== Call trigger methods ===========
            trigger.croncall()
            # db_conn = db.DatabaseOperation()
            # db_conn.duplicateInfoDelete()
            # db_conn.fileMetricsDelete()
            # db_conn.errorInfoDelete()
            # db_conn.fileInfoDelete()
            # isRep = trigger.Trigger().replicateRepo()
            # if isRep:
            #     file_dict = trigger.Trigger().getFilesWithDir()
            #     file_name_list = list()
            #     for file_name in file_dict:
            #         file_name_list.append(file_name)
            #     trigger.Trigger().getFileInfo(file_dict)
            #     trigger.Trigger().getFileMetrics(file_dict)
            #     #trigger.Trigger().generateDuplicate()
            #     trigger.Trigger().getErrorInfo(file_dict)
            # else:
            #     flash('Error while replicating repository')
            #     exit()
            # ===========================================

            # Temporarily disable redirect.
            return redirect('https://us-east-1.online.tableau.com/#/site/automatedprojectanalyser/workbooks/468077/views')
    return render_template('validate.html', form=form)
