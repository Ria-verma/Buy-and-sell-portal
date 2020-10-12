from datetime import datetime
from app import db

class Task(db.Model):
    uid=db.Column(db.Integer, primary_key=True)
    title=db.Column(db.String(100), nullable=False)
    date=db.Column(db.Date, nullable=False)

    def __repr__(self):
        return f'{self.title} created by {self.uid} on {self.date}'

class Profile(db.Model):
   __bind_key__ = 'profile'
   username= db.Column(db.String(100), nullable= False)
   email= db.Column(db.String(100), primary_key=True)
   contact= db.Column(db.Integer, nullable= False)
   address= db.Column(db.String(300), nullable= False)
   password= db.Column(db.String(100), nullable= False)
   uid= db.Column(db.Integer, nullable=False)

   def __repr__(self):
       return f'{self.username} has email {self.email}'


class Product(db.Model):
    __bind_key__ = 'product'
    pname= db.Column(db.String(150), nullable= False)
    category= db.Column(db.String(100), nullable= False)
    price= db.Column(db.Float, nullable= False)
    brand= db.Column(db.String(100))
    prodid= db.Column(db.Integer, primary_key= True)

    def __repr__(self):
       return f'{self.pname} has brand {self.brand}'






