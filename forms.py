from flask_wtf import FlaskForm
from wtforms import StringField, SubmitField, PasswordField, IntegerField, DecimalField, SelectField, RadioField
from wtforms.validators import DataRequired, NumberRange, Email

class AddTaskForm(FlaskForm):
    title= StringField('Email-id', validators=[DataRequired()])
    submit = SubmitField('Submit')

class Account(FlaskForm):
    username= StringField('Username', validators=[DataRequired()])
    email= StringField('Email-id', validators=[Email()])
    contact= IntegerField('Contact info', validators=[DataRequired()])
    address= StringField('Current Residence', validators=[DataRequired()])
    password= PasswordField('Password', validators=[DataRequired()])
    submit= SubmitField('Create Account')


class Items(FlaskForm):
    pname= StringField('Product-Name', validators=[DataRequired()])
    category= SelectField('Category', choices=[('stationery', 'Stationery'), ('gadgets', 'Tech gadgets'), 
    ('daily use', 'Daily-use Appliances'), ('loco', 'Locomotives'), ('other', 'Other stuff')])
    price= DecimalField('Price', validators=[DataRequired()])
    brand= StringField('Brand(If any)')
    submit= SubmitField('Upload')
    

