from flask import Flask, render_template, request, redirect, flash, session, url_for
from flask_mysqldb import MySQL
from flask_mail import Mail, Message
from datetime import datetime


import random

app=Flask(__name__)

#Configure db
app.config['SECRET_KEY'] = 'frgtehysi#%^*TGysuukx' 
app.config['MYSQL_HOST']='127.0.0.1'
app.config['MYSQL_USER']='root'
app.config['MYSQL_PASSWORD']='19285house'
app.config['MYSQL_DB']='website'

#Configure mail
app.config['MAIL_SERVER']='smtp.gmail.com'
app.config['MAIL_PORT'] = 465
app.config['MAIL_USERNAME'] = 'cs207courseproject@gmail.com'
app.config['MAIL_PASSWORD'] = 'cs207dbms'
app.config['MAIL_USE_TLS'] = False
app.config['MAIL_USE_SSL'] = True

mysql = MySQL(app)
mail = Mail(app)




# -------------------------------------------------------USER--------------------------------------------------------- 




def send_otp(reciever, otp):
    msg = Message('OTP', sender='cs207courseproject@gmail.com', recipients=[reciever])
    msg.body = "here is your one time password :"+str(otp)
    mail.send(msg)
    return redirect(url_for("verify"))





def send_otp_for_forgotPassword(reciever, otp):
    msg = Message('OTP', sender='cs207courseproject@gmail.com', recipients=[reciever])
    msg.body = "here is your one time password to reset your account password is :"+str(otp)
    mail.send(msg)
    return redirect(url_for("verify_to_reset_password"))






@app.route('/forgotPassword', methods=['GET', 'POST'])
def forgotPassword():
    if request.method == "POST":
        #Fetch form data
        email=request.form['email']
        otp = random.randrange(111111, 999999)
        session["otp"] = otp
        Y = send_otp_for_forgotPassword(email, otp)
        return Y
    return render_template('forgot_password.html')   




@app.route('/verify_to_reset_password', methods=['GET', 'POST'])
def verify_to_reset_password():
    if request.method == "POST":
        if "otp" in session:
            if session["otp"] == int(request.form["otp"]):
                cur = mysql.connection.cursor()
                cur.execute("INSERT INTO users(username, email, password) Values(%s,%s, %s)", (session["username"],session["email"], session["password"]))
                mysql.connection.commit()
                cur.close()
                session['loggedin']=True
                session['filled']=False
                return render_template('index.html')
            else:
                return "otp is wrong"
    return render_template('verify_to_reset.html') 





@app.route('/verify', methods=['GET', 'POST'])
def verify():
    if request.method == "POST":
        if "otp" in session:
            if session["otp"] == int(request.form["otp"]):
                cur = mysql.connection.cursor()
                cur.execute("INSERT INTO users(username, email, password) Values(%s,%s, %s)", (session["username"],session["email"], session["password"]))
                mysql.connection.commit()
                cur.close()
                session['loggedin']=True
                session['filled']=False
                return render_template('index.html')
            else:
                return "otp is wrong"
    return render_template('verify.html')   





@app.route('/signup', methods = ['GET', 'POST'])
def signup():
    if request.method == "POST":
        #Fetch form data
        userDetails=request.form
        username=userDetails['username']
        email=userDetails['email']
        password=userDetails['password']
        if len(username)==0 or len(email)==0 or len(password)==0:
            flash("Please fill the form completely!")
            
        else:
            
            cursor = mysql.connection.cursor()
            cursor.execute('SELECT * FROM users WHERE email=%s', (email,))
            account = cursor.fetchone()
            row_count = cursor.rowcount
            if row_count != 0:
                flash("You already have an account, Please sign in")
            else:
                session["email"]=email
                session["password"]=password
                session["username"]=username
                otp = random.randrange(111111, 999999)
                session["otp"] = otp
                Y = send_otp(email, otp)
                return Y
    return render_template('signup.html')




@app.route('/login', methods = ['GET', 'POST'])
def login():
    if request.method == "POST":
        if len(request.form['email'])==0 or len(request.form['password'])==0:
            flash("Invalid credentials!")

        else :
            email = request.form['email']
            password = request.form['password']
            session["email"]=email
            session["password"]=password
            # Check if account exists using MySQL
            cursor = mysql.connection.cursor()
            cursor.execute('SELECT * FROM users WHERE email=%s AND password =%s', (email, password))
            account = cursor.fetchone()
            # cursor.execute('SELECT * FROM users WHERE email=%s',(email,))
            # account1 = cursor.fetchall()
            row_count = cursor.rowcount
            if row_count == 0:
                flash("You don't have an account, Please create an account!")

            elif account[1]==session["email"] and session["password"]==account[2]:
                session["loggedin"] = True
                session["id"]=account[0]
                session["email"]=account[1]
                session["password"]=account[2]
                session["username"]=account[3]
                return render_template('index.html')

            elif account[2]!=session["password"]:
                flash("Wrong password!")


    return render_template("login.html")




@app.route('/logout')
def logout():
    session.clear()
    return render_template('index.html')





@app.route('/')
def home():
    cursor = mysql.connection.cursor()
    cursor.execute('SELECT * FROM products WHERE category=%s',('clothing',))
    account1 = cursor.fetchall()
    print(account1)
    return render_template("index.html", item1=account1)





@app.route('/contact')
def contact():
    return render_template("contact.html")




@app.route('/Catagories')
def catagories():
    cursor = mysql.connection.cursor()
    cursor.execute('SELECT * FROM products WHERE category=%s',('clothing',))
    account1 = cursor.fetchall()
    cursor.execute('SELECT * FROM products WHERE category=%s',('homedecor',))
    account2 = cursor.fetchall()
    cursor.execute('SELECT * FROM products WHERE category=%s',('watches',))
    account3 = cursor.fetchall()
    cursor.execute('SELECT * FROM products WHERE category=%s',('pantry',))
    account4 = cursor.fetchall()
    #print(account)
    return render_template('Catagori.html',items1=account1, items2=account2, items3=account3, items4=account4)
    




@app.route('/product_page/<int:pro_id>' , methods=['GET','POST'])
def product_page(pro_id):
    cur = mysql.connection.cursor()
    cur.execute( "SELECT * FROM products WHERE pid LIKE %s", [pro_id] )
    singleproduct = cur.fetchone()
    cur = mysql.connection.cursor()
    cur.execute( "SELECT * FROM price WHERE pid LIKE %s", [pro_id] )
    sproduct = cur.fetchone()
    minprice=sproduct[4]
    pro_name=singleproduct[1]
    if request.method == 'POST':
        if request.form['btn1'] == "Add to cart":
            userDetails=request.form
            quan=userDetails['quantity']
            cur = mysql.connection.cursor()
            cur.execute("INSERT INTO cart(user_id, pid,quantity) Values(%s,%s,%s)", [session["id"],pro_id,quan])
            mysql.connection.commit()
            cur.close()
        else:
            now = datetime.now()
            formatted_date = now.strftime('%Y-%m-%d %H:%M:%S')
            userDetails=request.form
            quan=userDetails['quantity']
            cur = mysql.connection.cursor()
            cur.execute("INSERT INTO orders(user_id, pro_id,quantity,price,datetime,pro_name) Values(%s,%s,%s,%s,%s,%s)", [session["id"],pro_id,quan,minprice,formatted_date,pro_name])
            mysql.connection.commit()
            cur.close()
            return "Your order is succesfully placed"
    return render_template('single-product.html',singleproduct=singleproduct,minprice=minprice)




@app.route('/myAccount', methods=['GET','POST'])
def myAccount():
    # if session['filled']==True:
    #     return render_template("filledaccount.html")
    # if request.method == "POST":
    #     userDetails=request.form
    #     houseno=userDetails['houseno']
    #     streetname=userDetails['streetname']
    #     city=userDetails['city']
    #     state=userDetails['state'] 
    #     pincode=userDetails['pincode']
    #     email=session["email"]
    #     session["houseno"]=houseno
    #     session["streetname"]=streetname
    #     session["city"]=city
    #     session["state"]=state
    #     session["pincode"]=pincode
    #     cur = mysql.connection.cursor()
    #     #cur.execute('UPDATE users SET houseno = 'houseno',streetname='streetname',city='city',state='state',pincode='pincode' WHERE (email='email')')
    #     cur.execute('UPDATE website.users SET houseno = %s,streetname=%s,city=%s,state=%s,pincode=%s WHERE (email=%s)',(houseno,streetname,city,state,pincode,session["email"])) 
    #     #UPDATE website.users SET houseno = 'houseno',streetname='streetname',city='city',state='state',pincode='pincode' WHERE (email='cse190001047@iiti.ac.in')
    #     mysql.connection.commit()
    #     cur.close()
    #     session['filled']=True
    #     return render_template('index.html')
    return render_template("myAccount.html")






@app.route('/cart')
def cart():
    cur = mysql.connection.cursor()
    cur.execute( "SELECT * FROM cart WHERE user_id LIKE %s", [session["id"]] )
    cartitems = cur.fetchall()
    cartlist = []
    tprice=0
    for item in cartitems:
        cur = mysql.connection.cursor()
        x=int(item[2])
        cur.execute( "SELECT * FROM products WHERE pid LIKE %s", [x] )
        products = cur.fetchone()
        Dict = {}
        Dict['proname']=products[1]
        Dict['pid']=products[0]
        Dict['price']=products[2]
        Dict['quantity']=item[3]
        Dict['category']=products[5]
        Dict['totalprice']=item[3]*Dict['price']
        cartlist.append(Dict)
        tprice=tprice+Dict['totalprice']
    return render_template('cart.html',carts=cartlist,totalprice=tprice)





@app.route('/buynow/<int:proid>',methods=['GET','POST'])
def buynow(proid):
    now = datetime.now()
    formatted_date = now.strftime('%Y-%m-%d %H:%M:%S')
    cur = mysql.connection.cursor()
    cur.execute("INSERT INTO order(userid, productid) Values(%s, %s)", [session['id'], proid])
    mysql.connection.commit()
    cur.close()
    return "Your order is succesfully placed"





@app.route('/orderHistory')
def orderHistory():
    return render_template("orderHistory.html")





@app.route('/table')
def table():
    return render_template("table.html")





@app.route('/confirmation')
def confirmation():
    return render_template("confirmation.html")







#----------------------------------------------------- VENDOR PAGE ------------------------------------------------



@app.route('/addProduct', methods=["GET", "POST"])                           
def addProduct():

   if request.method == 'POST':
       productDetails=request.form
       productname= productDetails['productname']
       category= productDetails['category']
       price= productDetails['price']
       disprice= productDetails['disprice']
       description=productDetails['description']
       cur = mysql.connection.cursor()
       cur.execute("INSERT INTO product(productname, category, description, price, disprice) VALUES(%s, %s, %s, %s, %s)", (productname, category, description, price, disprice))
       mysql.connection.commit()
       cur.close()
       return redirect('/display')
   return render_template('seller.html')





@app.route('/display', methods=["GET", "POST"])
def display():
    if request.method == 'POST':
        cur = mysql.connection.cursor()
        cur.execute("DELETE FROM product WHERE productname='Cakes'")
        mysql.connection.commit()
        cur.close()
        return render_template('display.html')
    cur = mysql.connection.cursor()
    result = cur.execute("SELECT * FROM product")
    if result >0:
        productDetails = cur.fetchall()
        return render_template('display.html', productDetails= productDetails)




# @app.route('/allProduct')
# def allProduct():
#     return render_template('product_list.html')




@app.route('/allProduct')
def allProduct():
    cursor = mysql.connection.cursor()
    cursor.execute('SELECT * FROM products WHERE category=%s',('homedecor',))
    account1 = cursor.fetchall()
    return render_template('product_list_vendor.html', item1=account1)




@app.route('/wishlist')
def wishlist():
    return render_template('product_list.html',)




@app.route('/myProduct')
def myProduct():
    return render_template('myProduct.html')





@app.route('/order')
def order():
    mycursor = mysql.connection.cursor()
    sql = "SELECT * FROM orders WHERE user_id = %s"
    adr = (session['id'], )
    mycursor.execute(sql, adr)
    myresult = mycursor.fetchall()
    return render_template("order.html",orders=myresult) 





#--------------------------------------------------- ADMIN PAGE -------------------------------------------------




@app.route('/newProduct')
def newProduct():
    return render_template("newProduct.html")




@app.route('/allProduct_admin')
def allProduct_admin():
    return render_template("allProduct_admin.html")



@app.route('/vendorList')
def vendorList():
    return render_template("vendorList.html")



@app.route('/buyerList')
def buyerList():
    return render_template("BuyerList.html")




@app.route('/verifyProduct/<int:pro_id>' , methods=['GET','POST'])
def verifyProduct(pro_id):
    if request.method == "POST":
        userDetails=request.form
        quan=userDetails['quantity']
        cur = mysql.connection.cursor()
        cur.execute("INSERT INTO cart(user_id, pid,quantity) Values(%s,%s,%s)", [session["id"],pro_id,quan])
        mysql.connection.commit()
        cur.close()
    cur = mysql.connection.cursor()
    cur.execute( "SELECT * FROM products WHERE pid LIKE %s", [pro_id] )
    singleproduct = cur.fetchone()
    return render_template('verify-product.html',singleproduct=singleproduct)
    
    


if __name__=='__main__':
    app.run(debug=True)