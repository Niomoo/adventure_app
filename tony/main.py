import numpy as np
import mysql.connector as mysql
from flask import Flask, request, jsonify
from flask_cors import CORS

# enter your server IP address/domain name
HOST = "remotemysql.com" # or "domain.com"
# database name, if you want just to connect to MySQL server, leave it empty
DATABASE = "Gt3eUb4zq1"
# this is the user you create
USER = "Gt3eUb4zq1"
# user password
PASSWORD = "wQ76pgmCix"
# connect to MySQL server
db_connection = mysql.connect(host=HOST, database=DATABASE, user=USER, password=PASSWORD)
print("Connected to:", db_connection.get_server_info())
# enter your code here!

app = Flask(__name__)
CORS(app)

@app.route('/')
def index():
    return 'hello!!'

@app.route('/login', methods=['POST'])
def login():
    # 取得前端傳過來的數值
    insertValues = request.get_json()
    account=insertValues['account']
    password=insertValues['password']
    mycursor = db_connection.cursor()

    mycursor.execute("Select mID From Manager Where username = %s And password = %s", (account,password))

    myresult = mycursor.fetchall()

    for x in myresult:
        print(x)

    return jsonify({'return': myresult })

@app.route('/createAccount', methods=['POST'])
def createAccount():
    # 取得前端傳過來的數值
    insertValues = request.get_json()
    account=insertValues['account']
    password=insertValues['password']
    mycursor1 = db_connection.cursor()
    mycursor1.execute("Select username From Manager Where username = %s", (account,))
    myresult1 = mycursor1.fetchall()
    if  len(myresult1) != 0:
        return jsonify({'return': "usernameused"})
    else:
        sqlStuff = "INSERT INTO `Manager`(`username`, `password`) VALUES (%s,%s)"
        records = [(account, password)]
        mycursor1.executemany(sqlStuff, records)
        db_connection.commit()
        return jsonify({'return': "successcreate"})

@app.route('/getAllGames', methods=['GET'])
def getAllGames():
    # 取得前端傳過來的數值
    insertValues = request.get_json()
    account=insertValues['account']
    mycursor1 = db_connection.cursor()
    mycursor1.execute("Select gID,name,description From Game,Manager Where mID = owner And username=%s", (account,))
    myresult1 = mycursor1.fetchall()
    if  len(myresult1) != 0:
        return jsonify({'return': myresult1})
    else:
        return "NOGAME"

@app.route('/getAllQuestions', methods=['GET'])
def getAllQuestions():
    # 取得前端傳過來的數值
    insertValues = request.get_json()
    gameID=insertValues['gameID']
    mycursor1 = db_connection.cursor()
    mycursor1.execute("Select * From Question Where gID = %s", (gameID,))
    myresult1 = mycursor1.fetchall()
    if  len(myresult1) != 0:
        return jsonify({'return': myresult1})
    else:
        return "NOQuestion"

@app.route('/createGame', methods=['POST'])
def createGame():
    # 取得前端傳過來的數值
    insertValues = request.get_json()
    account = insertValues['account']
    title = insertValues['title']
    description = insertValues['description']
    mycursor1 = db_connection.cursor()
    mycursor1.execute("Select mID From Manager Where username = %s",(account,))
    myresult1 = mycursor1.fetchall()
    # print(myresult1[0][0])
    sqlStuff = "INSERT INTO `Game`(name, description, owner) VALUES (%s,%s,%s)"
    records = [(title, description, myresult1[0][0])]
    mycursor1.executemany(sqlStuff, records)
    db_connection.commit()
    return jsonify({'return': 'createGameOK' })

@app.route('/updateGame', methods=['PATCH'])
def updateGame():
    # 取得前端傳過來的數值
    insertValues = request.get_json()
    gameID = insertValues['gameID']
    title = insertValues['title']
    description = insertValues['description']
    mycursor1 = db_connection.cursor()
    mycursor1.execute("UPDATE Game SET name = %s,description = %s WHERE gID = %s",(title,description,gameID))
    db_connection.commit()
    return jsonify({'return': 'updateGameOK' })

@app.route('/startGame', methods=['PATCH'])
def startGame():
    # 取得前端傳過來的數值
    insertValues = request.get_json()
    gameID = insertValues['gameID']
    mycursor1 = db_connection.cursor()
    mycursor1.execute("UPDATE Game SET status = 1 WHERE gID = %s",(gameID,))
    db_connection.commit()
    return jsonify({'return': 'startGame' })

@app.route('/endGame', methods=['PATCH'])
def endGame():
    # 取得前端傳過來的數值
    insertValues = request.get_json()
    gameID = insertValues['gameID']
    mycursor1 = db_connection.cursor()
    mycursor1.execute("UPDATE Game SET status = 0 WHERE gID = %s",(gameID,))
    db_connection.commit()
    return jsonify({'return': 'endGame' })

@app.route('/createQuestion', methods=['POST'])
def createQuestion():
    # 取得前端傳過來的數值
    insertValues = request.get_json()
    gameID = insertValues['gameID']
    question = insertValues['question']
    qType = insertValues['qType']
    latitude = insertValues['latitude']
    longitude = insertValues['longitude']
    score = insertValues['score']
    choice = insertValues['choice']
    feedback_right = insertValues['feedback_right']
    feedback_wrong = insertValues['feedback_wrong']
    mycursor1 = db_connection.cursor()
    sqlStuff = "INSERT INTO `Question`(gID, question, qType, latitude, longitude, score, feedback_right, feedback_wrong) VALUES (%s,%s,%s,%s,%s,%s,%s,%s)"
    records = [(gameID, question, qType, latitude, longitude, score, feedback_right, feedback_wrong)]
    mycursor1.executemany(sqlStuff, records)
    db_connection.commit()

    mycursor1.execute("Select qID From Question Where question = %s", (question,))
    myresult1 = mycursor1.fetchall()
    i=0
    for i in range(len(choice)):
        sqlStuff = "INSERT INTO `Choice`(qID, content, status) VALUES (%s,%s,%s)"
        records = [(myresult1[0][0], choice[i][0], choice[i][1],)]
        mycursor1.executemany(sqlStuff, records)
        db_connection.commit()

    return jsonify({'return': 'createQuestionOK' })

@app.route('/updateQuestion', methods=['PATCH'])
def updateQuestion():
    # 取得前端傳過來的數值
    insertValues = request.get_json()
    questionID = insertValues['questionID']
    qType = insertValues['qType']
    latitude = insertValues['latitude']
    longitude = insertValues['longitude']
    score = insertValues['score']
    choice = insertValues['choice']
    feedback_right = insertValues['feedback_right']
    feedback_wrong = insertValues['feedback_wrong']
    mycursor1 = db_connection.cursor()
    mycursor1.execute("UPDATE Question SET qType = %s, latitude = %s, longitude = %s, score = %s, feedback_right = %s, feedback_wrong = %s WHERE qID = %s",
                      (qType, latitude, longitude, score, feedback_right, feedback_wrong, questionID,))
    db_connection.commit()


    mycursor1.execute("Select cID From Choice Where qID = %s", (questionID,))
    myresult1 = mycursor1.fetchall()

    i=0
    for i in range(len(choice)):
        mycursor1.execute(
            "UPDATE Choice SET content = %s, status = %s WHERE cID = %s",
            (choice[i][0], choice[i][1], myresult1[i][0],))
        db_connection.commit()

    return jsonify({'return': 'updateQuestionOK' })

@app.route('/getScore', methods=['GET'])
def getScore():
    # 取得前端傳過來的數值
    insertValues = request.get_json()
    gameID=insertValues['gameID']
    name = insertValues['name']
    mycursor1 = db_connection.cursor()
    mycursor1.execute("Select `score`, `rank` From Player Where gID = %s And nickname = %s", (gameID,name,))
    myresult1 = mycursor1.fetchall()
    if  len(myresult1) != 0:
        return jsonify({'return': myresult1})
    else:
        return "NOPlayer"

@app.route('/joinGame', methods=['POST'])
def joinGame():
    # 取得前端傳過來的數值
    insertValues = request.get_json()
    gameID=insertValues['gameID']
    name = insertValues['name']
    mycursor1 = db_connection.cursor()
    sqlStuff = "INSERT INTO `Player`(gID, nickname) VALUES (%s,%s)"
    records = [(gameID, name,)]
    mycursor1.executemany(sqlStuff, records)
    db_connection.commit()
    return "join!!"

@app.route('/updateScore', methods=['PATCH'])
def updateScore():
    # 取得前端傳過來的數值
    insertValues = request.get_json()
    gameID = insertValues['gameID']
    name = insertValues['name']
    score = insertValues['score']
    mycursor1 = db_connection.cursor()
    mycursor1.execute("UPDATE Player SET score = %s WHERE gID = %s And nickname = %s",(score,gameID,name,))
    db_connection.commit()
    return jsonify({'return': 'updateScoreOK' })





if __name__ == '__main__':
    app.run(host='0.0.0.0', port=3000, debug=True)