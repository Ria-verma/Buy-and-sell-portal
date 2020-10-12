from flask import Flask
from flask_sqlalchemy import SQLAlchemy


app = Flask(__name__)
app.config['SECRET_KEY'] = 'secret-key'
app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///data.db'
app.config['SQLALCHEMY_BINDS'] = {'profile': 'sqlite:///profile.db', 'product': 'sqlite:///product.db'}

db = SQLAlchemy(app)

from rou import *

if __name__ == '__main__':
 app.run(debug=True)