from flask import Flask, render_template

app = Flask(__name__)

@app.route("/")
def main():
    return render_template('homesuccess.html')

@app.route('/showips')
def showip():
    return render_template('showips.html')


if __name__ == "__main__":
    app.run()


