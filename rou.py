from app import app
from app import db
from flask import render_template, redirect, url_for
from model import Task
from model import Profile
from model import Product
from datetime import datetime

import forms


@app.route('/info')
def index():
    tasks= Task.query.all()
    return render_template('info.html', tasks= tasks)


@app.route('/submission')    
def submit():
    profiles= Profile.query.all()
    return render_template('submission.html', profiles= profiles)

@app.route('/newentry')
def entry():    
    prods= Product.query.all()
    return render_template('newentry.html', prods= prods)



@app.route('/')
@app.route('/login', methods=['GET', 'POST'])
def about():
    form= forms.AddTaskForm()
    if form.validate_on_submit():
        t= Task(title= form.title.data, date= datetime.utcnow())
        db.session.add(t)
        db.session.commit()
        return redirect(url_for('index'))
    return render_template('login.html', form=form)


count=1
@app.route('/account', methods=['GET', 'POST'])
def user():
    form= forms.Account()
    if form.validate_on_submit():
        global count
        count+=1
        p= Profile(username= form.username.data, email=form.email.data, contact=form.contact.data, 
        address=form.address.data, password=form.password.data, uid=count)
        db.session.add(p)
        db.session.commit()
        return redirect(url_for('submit'))
    return render_template('account.html', form= form) 


prid=2
@app.route('/products', methods=['GET', 'POST'])
def item():
    form= forms.Items()
    if form.validate_on_submit():
        global prid
        prid+=1
        p= Product(pname= form.pname.data, category=form.category.data, price=form.price.data, brand= form.category.data, 
        prodid=prid)
        db.session.add(p)
        db.session.commit()
        return redirect(url_for('entry'))
    return render_template('products.html', form= form)   


