from flask import Flask, render_template, request, redirect, url_for, flash
from flask_mysqldb import MySQL

#inisialisasi flask sebagai variabel app
app = Flask(__name__)

app.secret_key= 'admin'
app.config['MYSQL_HOST']='localhost'
app.config['MYSQL_USER']='root'
app.config['MYSQL_PASSWORD']=''
app.config['MYSQL_DB']='hoteluyu'
mysql = MySQL(app)

@app.route("/admin")
def home():
    #hasil return ke file html
    return render_template('index.html')

@app.route('/')
def datapemesan():
    csr = mysql.connection.cursor()
    csr.execute("SELECT * FROM resepsionis ORDER BY id DESC")
    ambildata = csr.fetchall()
    csr.close()
    return render_template('index.html', showdata=ambildata)


@app.route('/', methods=['POST'])
def insert():
    if request.method == 'POST':
        nama = request.form['nama']
        email = request.form['email']
        nokamar = request.form['nokamar']
        tipe = request.form['tipe']
        checkin = request.form['checkin']
        checkout = request.form['checkout']
        jml = request.form['jml']
        ket = request.form['ket']

        cur = mysql.connection.cursor()
        cur.execute("INSERT INTO resepsionis (nama, email, nokamar, tipe, checkin, checkout, jml, ket) VALUES (%s, %s, %s, %s, %s, %s, %s, %s)", (nama, email, nokamar, tipe, checkin, checkout, jml, ket))
        mysql.connection.commit()
        flash("Data Berhasil di kirim")
        return redirect(url_for('home'))

@app.route('/customerupdate', methods=['POST'])
def customerupdate():
    if request.method == 'POST':
        id = request.form['id']
        nama = request.form['nama']
        email = request.form['email']
        nokamar = request.form['nokamar']
        tipe = request.form['tipe']
        checkin = request.form['checkin']
        checkout = request.form['checkout']
        jml = request.form['jml']
        status = request.form['status']

        cur = mysql.connection.cursor()
        cur.execute("UPDATE resepsionis SET nama=%s, email=%s, nokamar=%s, tipe=%s, checkin=%s, checkout=%s, jml=%s, status=%s WHERE id=%s", (nama, email, nokamar, tipe, checkin, checkout, jml, status, id))
        mysql.connection.commit()
        flash("Data Berhasil di Update")
        return redirect(url_for('datapemesan'))

# delete data
@app.route('/customerhapus/<int:id>', methods=["GET"])
def customerhapus(id):
    cur = mysql.connection.cursor()
    cur.execute("DELETE FROM resepsionis WHERE id=%s", (id,))
    mysql.connection.commit()
    flash("Data Berhasil di Hapus")
    return redirect( url_for('datapemesan'))



if __name__ =='__main__':
    app.run(debug=True)