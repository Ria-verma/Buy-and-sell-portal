from flask import Flask, render_template, request, redirect, flash, session, url_for
from flask_mysqldb import MySQL
from flask_mail import Mail, Message
from datetime import datetime
import random
import os
from werkzeug.utils import secure_filename
from PIL import Image
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
                now = datetime.now()
                formatted_date = now.strftime('%Y-%m-%d %H:%M:%S')
                if(session['recipent']=='buyer'):
                    cur.execute("INSERT INTO users(username, email, password, join_date) Values(%s,%s, %s, %s)", (session["username"],session["email"], session["password"], formatted_date))
                
                elif(session['recipent']=='seller'):
                    cur.execute("INSERT INTO seller(seller_name, email, password, join_date) Values(%s,%s, %s, %s)", (session["username"],session["email"], session["password"], formatted_date))
                
                elif(session['recipent']=='admin'):
                    cur.execute("INSERT INTO admin(username, email, password, join_date) Values(%s,%s, %s, %s)", (session["username"],session["email"], session["password"], formatted_date))
                
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
        recipent=userDetails['recipent']
        session['recipent']=recipent
        if len(username)==0 or len(email)==0 or len(password)==0:
            flash("Please fill the form completely!")
            
        else:

            if(recipent=='buyer'):
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


            elif(recipent=='seller'):
                cursor = mysql.connection.cursor()
                cursor.execute('SELECT * FROM'+'seller'+' WHERE email=%s', (email,))
                account = cursor.fetchone()
                row_count = cursor.rowcount
                if row_count != 0:
                    flash("You already have an account, Please sign in")
                else:
                    session["email"] = email
                    session["password"] = password
                    session["username"] = username
                    otp = random.randrange(111111, 999999)
                    session["otp"] = otp
                    Y = send_otp(email, otp)
                    return Y



            elif(recipent=='admin'):
                cursor = mysql.connection.cursor()
                cursor.execute('SELECT * FROM'+'admin'+' WHERE email=%s', (email,))
                account = cursor.fetchone()
                row_count = cursor.rowcount
                if row_count != 0:
                    flash("You already have an account, Please sign in")
                else:
                    session["email"] = email
                    session["password"] = password
                    session["username"] = username
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
            recipent = request.form['recipent']


            print("ejfoierjgoiergjoij")
            print(recipent)


            # Check if account exists using MySQL
            cursor = mysql.connection.cursor()
            if(recipent=='buyer'):
                cursor.execute('SELECT * FROM users WHERE email LIKE %s', ([email]))
                account = cursor.fetchone()
                
                row_count = cursor.rowcount
                if row_count == 0:
                    flash("You don't have a buyer account, Please create an account!")

                elif account[2]==email and password==account[3]:
                    session["loggedin"] = True
                    session["id"]=account[0]
                    return render_template('index.html')

                elif account[2]!=password:
                    print(password)
                    print(account)
                    flash("Wrong password!")



            elif(recipent=='seller'):
                cursor.execute('SELECT * FROM seller WHERE email LIKE %s', ([email]))
                account = cursor.fetchone()
                
                row_count = cursor.rowcount
                if row_count == 0:
                    flash("You don't have a seller account, Please create an account!")

                elif account[2] == email and password == account[10]:
                    session["loggedin"] = True
                    session["id"] = account[0]
                    return render_template('index.html')

                elif account[2] != password:
                    print(password)
                    print(account[3])
                    flash("Wrong password!")


            elif(recipent=='admin'):
                cursor.execute('SELECT * FROM admin WHERE email LIKE %s', ([email]))
                account = cursor.fetchone()

                row_count = cursor.rowcount
                if row_count == 0:
                    flash("You don't have an Admin account, Please create an account!")

                elif account[1] == email and password == account[3]:
                    session["loggedin"] = True
                    session["id"] = account[0]
                    return render_template('index.html')

                elif account[2] != password:
                    print(password)
                    print(account)
                    flash("Wrong password!")

    return render_template("login.html")






@app.route('/logout')
def logout():
    session.clear()
    return render_template('index.html')







@app.route('/')
def home():
    cur = mysql.connection.cursor()
    # cur.execute('SELECT * FROM products WHERE category=%s',('clothing',))
    # account1 = cur.fetchall()
    category1 = []
    cur.execute('SELECT * FROM products WHERE category=%s',('clothing',))
    allproducts = cur.fetchall()
    for products in allproducts:
        Dict = {}
        Dict['pid']=products[0]
        Dict['proname']=products[1]
        Dict['price']=products[2]
        Dict['category']=products[5]
        cur.execute("SELECT * FROM price WHERE pid=%s ORDER BY disprice", [products[0]])

        if cur.rowcount != 0:
            row = cur.fetchone()
            cur.execute("SELECT * FROM seller WHERE vid=%s", [row[2]])
            seller = cur.fetchone()
            Dict['sellerid']=seller[0]
            Dict['disprice']=row[4]
            category1.append(Dict)
    return render_template('index.html',category1 = category1,)
    






@app.route('/contact')
def contact():
    return render_template("contact.html")






@app.route('/Catagories')
def catagories():
    cur = mysql.connection.cursor()
    # cur.execute('SELECT * FROM products WHERE category=%s',('clothing',))
    # account1 = cur.fetchall()
    category1 = []
    cur.execute('SELECT * FROM products WHERE category=%s',('clothing',))
    allproducts = cur.fetchall()
    for products in allproducts:
        Dict = {}
        Dict['pid']=products[0]
        Dict['proname']=products[1]
        Dict['price']=products[2]
        Dict['category']=products[5]
        # Dict['rating']=int(products[7])
        Dict['rating']=4
        # Dict['no_of_ppl']=int(products[8])
        Dict['no_of_ppl']=6
        cur.execute("SELECT * FROM price WHERE pid=%s ORDER BY disprice", [products[0]])

        if cur.rowcount != 0:
            row = cur.fetchone()
            cur.execute("SELECT * FROM seller WHERE vid=%s", [row[2]])
            seller = cur.fetchone()
            Dict['sellerid']=seller[0]
            Dict['disprice']=row[4]
            category1.append(Dict)



    category2 = []
    cur.execute('SELECT * FROM products WHERE category=%s',('homedecor',))
    allproducts = cur.fetchall()
    for products in allproducts:
        Dict = {}
        Dict['pid']=products[0]
        Dict['proname']=products[1]
        Dict['price']=products[2]
        Dict['category']=products[5]
        # Dict['rating']=int(products[7])
        Dict['rating']=4
        # Dict['no_of_ppl']=int(products[8])
        Dict['no_of_ppl']=6
        cur.execute("SELECT * FROM price WHERE pid=%s ORDER BY disprice", [products[0]])

        if cur.rowcount != 0:
            row = cur.fetchone()
            cur.execute("SELECT * FROM seller WHERE vid=%s", [row[2]])
            seller = cur.fetchone()
            Dict['sellerid']=seller[0]
            Dict['disprice']=row[4]
            category2.append(Dict)



    category3 = []
    cur.execute('SELECT * FROM products WHERE category=%s',('watches',))
    allproducts = cur.fetchall()
    for products in allproducts:
        Dict = {}
        Dict['pid']=products[0]
        Dict['proname']=products[1]
        Dict['price']=products[2]
        Dict['category']=products[5]
        # Dict['rating']=int(products[7])
        Dict['rating']=4
        # Dict['no_of_ppl']=int(products[8])
        Dict['no_of_ppl']=6
        cur.execute("SELECT * FROM price WHERE pid=%s ORDER BY disprice", [products[0]])

        if cur.rowcount != 0:
            row = cur.fetchone()
            cur.execute("SELECT * FROM seller WHERE vid=%s", [row[2]])
            seller = cur.fetchone()
            Dict['sellerid']=seller[0]
            Dict['disprice']=row[4]
            category3.append(Dict)




    category4 = []
    cur.execute('SELECT * FROM products WHERE category=%s',('pantry',))
    allproducts = cur.fetchall()
    for products in allproducts:
        Dict = {}
        Dict['pid']=products[0]
        Dict['proname']=products[1]
        Dict['price']=products[2]
        Dict['category']=products[5]
        # Dict['rating']=int(products[7])
        Dict['rating']=4
        # Dict['no_of_ppl']=int(products[8])
        Dict['no_of_ppl']=6
        cur.execute("SELECT * FROM price WHERE pid=%s ORDER BY disprice", [products[0]])

        if cur.rowcount != 0:
            row = cur.fetchone()
            cur.execute("SELECT * FROM seller WHERE vid=%s", [row[2]])
            seller = cur.fetchone()
            Dict['sellerid']=seller[0]
            Dict['disprice']=row[4]
            category4.append(Dict)
    #print(account)
    return render_template('Catagori.html',category1 = category1,category2 = category2,category3 = category3,category4 = category4)
    








#A FUNCTION TO update the cart of people whose quantity of that item in cart is more than the current updated stock

def update_cart(user_id):
    cur = mysql.connection.cursor()
    #select all items of current user in cart 
    cur.execute("SELECT * FROM cart WHERE user_id =%s", [user_id])
    rows = cur.fetchall()

    for row in rows:
        cur.execute("SELECT * FROM price WHERE vid =%s AND pid = %s", [row[4], row[2]])
        prod = cur.fetchone()
        #if stock is less than quantity in cart
        if prod[6] < row[3]:
            cur.execute("UPDATE cart SET quantity = %s WHERE id = %s", [prod[6], row[0]])
            mysql.connection.commit()

    cur.close()

















@app.route('/single_product_page/<int:pro_id>/<int:v_id>' , methods=['GET','POST'])
def single_product_page(pro_id, v_id):
    # updates cart first
    update_cart(session['id'])


    cur = mysql.connection.cursor()
    #select the specific product
    cur.execute( "SELECT * FROM products WHERE pid LIKE %s", [pro_id] )
    curr_product = cur.fetchone()
    pro_name = curr_product[1]
    

    #data of current seller
    cur.execute( "SELECT * FROM seller WHERE vid = %s", [v_id] )
    curr_seller = cur.fetchone()

    #select current price row
    cur.execute("SELECT * FROM price WHERE vid=%s AND pid=%s", [v_id, pro_id])
    curr_price = cur.fetchone()

    #select all vendors who r selling
    cur.execute( "SELECT * FROM price WHERE pid LIKE %s ORDER BY disprice", [pro_id] )
    rows = cur.fetchall()
    sellerList = []
    

    #extract the data of all sellers selling that product
    for row in rows:
        print("rewrwerwero")
        vid = int(row[2])
        cur.execute( "SELECT * FROM seller WHERE vid = %s", [vid] )
        vendor = cur.fetchone()
        Dict = {}
        Dict["vid"] = vid
        Dict["s_name"] = vendor[1]
        Dict["sell_at_price"] = row[4]
        sellerList.append(Dict)

    
    #to check that product in cart:- if it already exists or not (from all seller)
    cur.execute("SELECT* FROM cart WHERE user_id = %s AND pid = %s", [session["id"], pro_id])
    all_in_cart = cur.fetchall()
    total_in_cart = 0
    for row in all_in_cart:
        total_in_cart += row[3]
    

    #to check that product in cart:- if it already exists or not (from current seller)
    cur.execute("SELECT* FROM cart WHERE user_id = %s AND pid = %s AND vid = %s", [session["id"], pro_id, v_id])
    row_cnt = cur.rowcount
    in_cart = 0


    prod = 0
    #agr already exist karta hai vo product cart me...
    if row_cnt!=0:
        prod = cur.fetchone()
        #quantity in cart already
        in_cart = prod[3]
    
    cur.close()

    if request.method == 'POST':
        if request.form['btn1'] == "Add to cart":
            quan = 1
            #if cart me exist nahi karta 
            if row_cnt == 0:
                cur = mysql.connection.cursor()
                #saath me vid me daal dena idhar.....
                cur.execute("INSERT INTO cart(user_id, pid, quantity, vid) Values( %s, %s, %s, %s)", [ session["id"], pro_id, quan, v_id])
                mysql.connection.commit()
                cur.close()
            else:
                count = min(curr_price[6],in_cart + 1)
                cur = mysql.connection.cursor()
                #vid here too
                cur.execute("UPDATE cart SET quantity = %s WHERE user_id = %s AND pid = %s AND vid = %s", [count, session["id"], pro_id, v_id])
                mysql.connection.commit()
                cur.close()
       
       #ye "elif" me error aa raha tha.....but "else" is working fine
        elif request.form['btn1'] == "Buy now":
        
            #Updating stock of seller
            # cur.execute("UPDATE price SET stock = %s WHERE id = %s", [ curr_price[6]-1, curr_price[0]])
            # mysql.connection.commit()
            # cur.close()
            return redirect(url_for('checkout1', v_id=v_id, pro_id=pro_id))

        else:

            return redirect(url_for('single_product_page', v_id=v_id, pro_id=pro_id))
            
    return render_template('single-product.html',singleproduct=curr_product,minprice=curr_price[4], sellerList = sellerList, curr_seller=curr_seller, in_cart = in_cart, total_in_cart = total_in_cart)











@app.route('/decrease_in_cart/<int:pro_id>/<int:v_id>')
def decrease_in_cart( pro_id, v_id):
    cur = mysql.connection.cursor()
    cur.execute("SELECT * FROM cart WHERE user_id = %s AND pid=%s AND vid = %s", [session["id"], pro_id, v_id] )
    row = cur.fetchone()
    count = row[3]-1
    cur.execute("UPDATE cart SET quantity = %s WHERE user_id = %s AND pid = %s AND vid = %s", [count, session["id"], pro_id, v_id])
    mysql.connection.commit()
    cur.close()
    return redirect(url_for('cart'))






@app.route('/delete_in_cart/<int:pro_id>/<int:v_id>')
def delete_in_cart( pro_id, v_id):
    cur = mysql.connection.cursor()
    cur.execute("DELETE FROM cart WHERE user_id = %s AND pid=%s AND vid = %s", [session["id"], pro_id, v_id] )
    mysql.connection.commit()
    cur.close()
    return redirect(url_for('cart'))






@app.route('/cart', methods=['GET','POST'])
def cart():
    cur = mysql.connection.cursor()
    cur.execute( "SELECT * FROM cart WHERE user_id LIKE %s", [session["id"]] )
    cartitems = cur.fetchall()
    cartlist = []
    tprice=0
    for item in cartitems:
        cur = mysql.connection.cursor()
        pid=int(item[2])
        cur.execute( "SELECT * FROM products WHERE pid LIKE %s", [pid] )
        allproducts = cur.fetchall()
        Dict = {}
        for products in allproducts:
            Dict['pid']=products[0]
            Dict['proname']=products[1]
            Dict['price']=products[2]
            Dict['quantity']=item[3]
            Dict['totalprice']=item[3]*Dict['price']
            cur.execute("SELECT * FROM seller WHERE vid=%s", [item[4]])
            seller = cur.fetchone()
            Dict['seller']=seller[1]
            Dict['sellerid']=seller[0]
            Dict['category']=products[5]
            cartlist.append(Dict)
            tprice=tprice+Dict['totalprice']
    return render_template('cart.html',carts=cartlist,totalprice=tprice)







@app.route('/myAccount', methods=['GET','POST'])
def myAccount():
    return render_template("myAccount.html")








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



@app.route('/checkout', methods=['GET','POST'])
def checkout():
    if request.method == "POST":
        first_name = request.form['first']
        last_name = request.form['last']
        company = request.form['company']
        number = request.form['number']
        email = request.form['email']
        add1 = request.form['add1']
        add2 = request.form['add2']
        city = request.form['city']
        district = request.form['district']
        Postcode = request.form['Postcode']
        order_notes = request.form['message']
        payment_method = "cash"

        # if len(request.form['first'])==0 or len(request.form['last'])==0 or len(request.form['number'])==0 or len(request.form['email'])==0 or len(request.form['add1'])==0 or len(request.form['add2'])==0 or len(request.form['city'])==0 or len(request.form['district'])==0 or len(request.form['zip'])==0:
        #     flash("Please Fill all the necessary details!")
        # else :
        cur = mysql.connection.cursor()
        now = datetime.now()
        formatted_date = now.strftime('%Y-%m-%d %H:%M:%S')
        #inserting into order details

        cur.execute("INSERT INTO order_details(first_name, last_name, company, number, email, add1, add2, city, district, Postcode, order_notes, payment_method, datetime) Values(%s,%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)", (first_name, last_name, company, number, email, add1, add2, city, district, Postcode, order_notes, payment_method, formatted_date))
        mysql.connection.commit()

        cur.execute( "SELECT * FROM cart WHERE user_id LIKE %s", [session["id"]] )
        cartitems = cur.fetchall()
        cur.close()
        tprice=0

        for item in cartitems:

            cur = mysql.connection.cursor()
            cur.execute("SELECT * FROM price WHERE vid=%s AND pid=%s", [item[4], item[2]])
            curr_price = cur.fetchone()
            #for order id
            cur.execute("SELECT * FROM order_details WHERE first_name=%s AND last_name=%s AND company=%s AND number=%sAND email=%s AND add1=%s AND add2=%s AND city=%s AND district=%s AND Postcode=%s AND order_notes=%s AND payment_method=%s AND datetime=%s", [first_name, last_name, company, number, email, add1, add2, city, district, Postcode, order_notes, payment_method, formatted_date])
            curr_order = cur.fetchone()
            cur.close()
        return redirect( url_for('confirmation', did = curr_order[0]))

    cur = mysql.connection.cursor()
    cur.execute( "SELECT * FROM cart WHERE user_id LIKE %s", [session["id"]] )
    cartitems = cur.fetchall()
    cartlist = []
    tprice=0
    for item in cartitems:
        cur = mysql.connection.cursor()
        pid=int(item[2])
        cur.execute( "SELECT * FROM products WHERE pid LIKE %s", [pid] )
        allproducts = cur.fetchall()
        Dict = {}
        for products in allproducts:
            Dict['pid']=products[0]
            Dict['proname']=products[1]
            Dict['price']=products[2]
            Dict['quantity']=item[3]
            Dict['totalprice']=item[3]*Dict['price']
            cur.execute("SELECT * FROM seller WHERE vid=%s", [item[4]])
            seller = cur.fetchone()
            Dict['seller']=seller[1]
            Dict['seller_id']=seller[0]
            Dict['category']=products[5]
            cartlist.append(Dict)
            tprice=tprice+Dict['totalprice']
            print(tprice)
    return render_template("checkout.html", carts=cartlist, totalprice=tprice)







@app.route('/checkout1/<int:pro_id>/<int:v_id>', methods=['GET','POST'])
def checkout1(pro_id, v_id):
    if request.method == "POST":
        first_name = request.form['first']
        last_name = request.form['last']
        company = request.form['company']
        number = request.form['number']
        email = request.form['email']
        add1 = request.form['add1']
        add2 = request.form['add2']
        city = request.form['city']
        district = request.form['district']
        Postcode = request.form['Postcode']
        order_notes = request.form['message']
        payment_method = "cash"

        # if len(request.form['first'])==0 or len(request.form['last'])==0 or len(request.form['number'])==0 or len(request.form['email'])==0 or len(request.form['add1'])==0 or len(request.form['add2'])==0 or len(request.form['city'])==0 or len(request.form['district'])==0 or len(request.form['zip'])==0:
        #     flash("Please Fill all the necessary details!")
        # else :
        cur = mysql.connection.cursor()
        now = datetime.now()
        formatted_date = now.strftime('%Y-%m-%d %H:%M:%S')
        #inserting into order details
        cur.execute("INSERT INTO order_details(first_name, last_name, company, number, email, add1, add2, city, district, Postcode, order_notes, payment_method, datetime) Values(%s,%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)", (first_name, last_name, company, number, email, add1, add2, city, district, Postcode, order_notes, payment_method, formatted_date))
        mysql.connection.commit()
        tprice=0

        cur.execute("SELECT * FROM price WHERE vid=%s AND pid=%s", [ v_id, pro_id])
        curr_price = cur.fetchone()
        #for order id
        cur.execute("SELECT * FROM order_details WHERE first_name=%s AND last_name=%s AND company=%s AND number=%sAND email=%s AND add1=%s AND add2=%s AND city=%s AND district=%s AND Postcode=%s AND order_notes=%s AND payment_method=%s AND datetime=%s", [first_name, last_name, company, number, email, add1, add2, city, district, Postcode, order_notes, payment_method, formatted_date])
        curr_order = cur.fetchone()
        cur.close()
        return redirect( url_for('confirmation', pro_id=pro_id, v_id=v_id, did = curr_order[0]))






    cur = mysql.connection.cursor()
    cartlist = []
    tprice=0
    cur = mysql.connection.cursor()
    cur.execute( "SELECT * FROM products WHERE pid LIKE %s", [pro_id] )
    allproducts = cur.fetchall()
    Dict = {}
    for products in allproducts:
        Dict['pid']=products[0]
        Dict['proname']=products[1]
        Dict['price']=products[2]
        Dict['quantity']=1
        Dict['totalprice']=1*Dict['price']
        cur.execute("SELECT * FROM seller WHERE vid=%s", [v_id])
        seller = cur.fetchone()
        Dict['seller']=seller[1]
        Dict['seller_id']=seller[0]
        Dict['category']=products[5]
        cartlist.append(Dict)
        tprice=tprice+Dict['totalprice']
        print(tprice)
    return render_template("checkout.html", carts=cartlist, totalprice=tprice)







@app.route('/confirmation/<int:did>', methods = ['GET', 'POST'])
def confirmation(did):
    cur = mysql.connection.cursor()
    
    now = datetime.now()
    formatted_date = now.strftime('%Y-%m-%d %H:%M:%S')
    
    cur.execute( "SELECT * FROM cart WHERE user_id LIKE %s", [session["id"]] )
    cartitems = cur.fetchall()
    
    cur.execute("SELECT * FROM order_details WHERE did = %s", [did])
    details = cur.fetchone()

    cartlist = []
    tprice=0
    tquantity=0
    for item in cartitems:
        pid=int(item[2])
        cur.execute( "SELECT * FROM products WHERE pid LIKE %s", [pid] )
        allproducts = cur.fetchall()
        Dict = {}
        for products in allproducts:
            Dict['pid']=products[0]
            Dict['proname']=products[1]
            Dict['price']=products[2]
            Dict['quantity']=item[3]
            tquantity+=item[3]
            Dict['totalprice']=item[3]*Dict['price']
            cur.execute("SELECT * FROM seller WHERE vid=%s", [item[4]])
            seller = cur.fetchone()
            Dict['seller']=seller[1]
            Dict['sellerid']=seller[0]
            Dict['category']=products[5]
            cartlist.append(Dict)
            tprice=tprice+Dict['totalprice']

    for item in cartitems:
        cur.execute("SELECT * FROM price WHERE vid=%s AND pid=%s", [item[4], item[2]])
        curr_price = cur.fetchone()
        
        cur.execute("INSERT INTO orders( user_id, pro_id, quantity, price, datetime, vid, did) Values( %s, %s, %s, %s, %s, %s, %s)", [ session["id"], item[2], item[3], curr_price[3], formatted_date, item[4], details[0]])
        mysql.connection.commit()



    return render_template("confirmation.html", carts= cartlist, totalprice = tprice, totalquantity= tquantity, details = details)








@app.route('/confirmation1/<int:pro_id>/<int:v_id>/<int:did>', methods = ['GET', 'POST'])
def confirmation1(pro_id, v_id, did):
    cur = mysql.connection.cursor()
    
    now = datetime.now()
    formatted_date = now.strftime('%Y-%m-%d %H:%M:%S')
    
    cur.execute( "SELECT * FROM cart WHERE user_id LIKE %s", [session["id"]] )
    cartitems = cur.fetchall()
    
    cur.execute("SELECT * FROM order_details WHERE did = %s", [did])
    details = cur.fetchone()



    cartlist = []
    tprice=0
    tquantity=0
    cur.execute( "SELECT * FROM products WHERE pid LIKE %s", [pro_id] )
    allproducts = cur.fetchall()
    Dict = {}
    for products in allproducts:
        Dict['pid']=products[0]
        Dict['proname']=products[1]
        Dict['price']=products[2]
        Dict['quantity']=1
        tquantity+=1
        Dict['totalprice']=1*Dict['price']
        cur.execute("SELECT * FROM seller WHERE vid=%s", [v_id])
        seller = cur.fetchone()
        Dict['seller']=seller[1]
        Dict['sellerid']=seller[0]
        Dict['category']=products[5]
        cartlist.append(Dict)
        tprice=tprice+Dict['totalprice']


    for item in cartitems:
        cur.execute("SELECT * FROM price WHERE vid=%s AND pid=%s", [item[4], item[2]])
        curr_price = cur.fetchone()

    cur.execute("INSERT INTO orders( user_id, pro_id, quantity, price, datetime, vid, did) Values( %s, %s, %s, %s, %s, %s, %s)", [ session["id"], item[2], item[3], curr_price[3], formatted_date, item[4], details[0]])
    mysql.connection.commit()

    return render_template("confirmation1.html", carts= cartlist, totalprice = tprice, totalquantity= tquantity, details = details)








#----------------------------------------------------- VENDOR PAGE ------------------------------------------------












@app.route('/addProduct', methods=["GET", "POST"])
def addProduct():
    session['id']=1
    if request.method == 'POST':
        productDetails=request.form
        pname= productDetails['pname']
        category= productDetails['category']
        price= productDetails['price']
        disprice= productDetails['disprice']
        pdetails=productDetails['pdetails']
        stock=productDetails['stock']
        cur = mysql.connection.cursor()
        cur.execute("INSERT INTO temporary_product(pname, vid, category, pdetails, price, disprice,stock) VALUES(%s, %s, %s, %s, %s, %s,%s)", (pname, session['id'], category, pdetails, price, disprice,stock))
        mysql.connection.commit()
        rid=cur.execute("SELECT rid FROM temporary_product WHERE pname=%s AND vid=%s AND  category=%s AND pdetails=%s AND price=%s AND disprice,stock=%S",(pname, session['id'], category, pdetails, price, disprice,stock))
        cur.close()

        file = request.files['file']
        if (file and file.filename != ''):
            if (os.path.isfile('C:\\Users\\kumar\\PycharmProjects\\fllask\\static\\img\\users\\' + str(rid) + '.jpg')):
                os.remove('C:\\Users\\kumar\\PycharmProjects\\fllask\\static\\img\\users\\' + str(rid) + '.jpg')
            l = file.filename.split('.')
            file.filename = str(rid) + '1' + '.' + str(l[-1])
            filename = secure_filename(file.filename)
            file.save(os.path.join('C:\\Users\\kumar\\PycharmProjects\\fllask\\static\\img\\users', filename))
            s = 'C:\\Users\\kumar\\PycharmProjects\\fllask\\static\\img\\users\\' + str(filename)
            img1 = Image.open(s)
            img2 = img1.convert('RGB')
            s = 'C:\\Users\\kumar\\PycharmProjects\\fllask\\static\\img\\users\\' + str(rid) + '.jpg'
            img2.save(s)
            os.remove('C:\\Users\\kumar\\PycharmProjects\\fllask\\static\\img\\users\\' + filename)
        return redirect(url_for('myProduct'))
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
