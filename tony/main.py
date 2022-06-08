import numpy as np
import mysql.connector as mysql
from flask import Flask, request, jsonify
from flask_cors import CORS
import json

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
    value = {
        "account":myresult[0][0]
    }
    mycursor.close()
    return json.dumps(value)

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
        mycursor1.close()
        return jsonify({'return': "usernameused"})
    else:
        sqlStuff = "INSERT INTO `Manager`(`username`, `password`) VALUES (%s,%s)"
        records = [(account, password)]
        mycursor1.executemany(sqlStuff, records)
        db_connection.commit()
        mycursor1.close()
        return jsonify({'return': "successcreate"})

@app.route('/getAllGames/', methods=['GET'])
def getAllGames():
    account=request.values.get('account')
    mycursor1 = db_connection.cursor()
    mycursor1.execute("Select gID,name,description,status From Game,Manager Where mID = owner And username=%s", (account,))
    myresult1 = mycursor1.fetchall()
    mycursor1.close()
    if  len(myresult1) != 0:
        value=[]
        i = 0
        for i in range(len(myresult1)):
            user = {}
            user['gameID'] = myresult1[i][0]
            user['title'] = myresult1[i][1]
            user['description'] = myresult1[i][2]
            user['status'] = myresult1[i][3]
            value.append(user)
        # data['users'] = users
        return json.dumps(value)
    else:
        return "NOGAME"

@app.route('/getAllQuestions/', methods=['GET'])
def getAllQuestions():

    gameID=request.values.get('gameID')
    mycursor1 = db_connection.cursor()
    mycursor1.execute("Select * From Question Where gID = %s", (gameID,))
    myresult1 = mycursor1.fetchall()

    # i = 0
    # for i in range(len(myresult1)):
    #     value[i] = {
    #         "questionID": myresult[0][0],
    #         "question": myresult[0][1],
    #         "type": myresult[0][2],
    #         "latitude": myresult[0][3],
    #         "longitude": myresult[0][0],
    #         "score": myresult[0][0],
    #         "choice": myresult[0][0],
    #         "feedback_right": myresult[0][0],
    #         "feedback_wrong": myresult[0][0]
    #     }

    mycursor1.close()
    if  len(myresult1) != 0:
        return myresult1
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
    mycursor1.close()
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
    mycursor1.close()
    return jsonify({'return': 'updateGameOK' })

@app.route('/startGame', methods=['PATCH'])
def startGame():
    # 取得前端傳過來的數值
    insertValues = request.get_json()
    gameID = insertValues['gameID']
    mycursor1 = db_connection.cursor()
    mycursor1.execute("UPDATE Game SET status = 1 WHERE gID = %s",(gameID,))
    db_connection.commit()
    mycursor1.close()
    return jsonify({'return': 'startGame' })

@app.route('/endGame', methods=['PATCH'])
def endGame():
    # 取得前端傳過來的數值
    insertValues = request.get_json()
    gameID = insertValues['gameID']
    mycursor1 = db_connection.cursor()
    mycursor1.execute("UPDATE Game SET status = 0 WHERE gID = %s",(gameID,))
    db_connection.commit()
    mycursor1.close()
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

    mycursor1.execute("Select QID From Question Where question = %s", (question,))
    myresult1 = mycursor1.fetchall()
    i=0
    for i in range(len(choice)):
        sqlStuff = "INSERT INTO `Choice`(qID, content, status) VALUES (%s,%s,%s)"
        records = [(myresult1[0][0], choice[i][0], choice[i][1],)]
        mycursor1.executemany(sqlStuff, records)
        db_connection.commit()
    mycursor1.close()
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
    mycursor1.execute("UPDATE Question SET qType = %s, latitude = %s, longitude = %s, score = %s, feedback_right = %s, feedback_wrong = %s WHERE QID = %s",
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
    mycursor1.close()
    return jsonify({'return': 'updateQuestionOK' })

@app.route('/getScore/', methods=['GET'])
def getScore():

    gameID=request.values.get('gameID')
    name = request.values.get('name')
    mycursor1 = db_connection.cursor()
    mycursor1.execute("Select `score`, `rank` From Player Where gID = %s And nickname = %s", (gameID,name,))
    myresult1 = mycursor1.fetchall()
    mycursor1.close()
    if  len(myresult1) != 0:
        return myresult1
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
    mycursor1.close()
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
    # F = mycursor1.fetchall()
    db_connection.commit()
    mycursor1.close()

    mycursor2 = db_connection.cursor()
    mycursor2.execute("SELECT `nickname` FROM Player Where gID = %s ORDER BY score DESC", (gameID,))
    myresult2 = mycursor2.fetchall()
    print(myresult2[0][0])
    j=0
    for j in range(len(myresult2)):
        mycursor2.execute("UPDATE Player SET `rank` = %s WHERE gID = %s And nickname = %s", (j+1, gameID, myresult2[j][0],))
        db_connection.commit()
    mycursor2.close()
    return jsonify({'return': 'updateScoreOK' })

@app.route('/getRank/', methods=['GET'])
def getRank():

    gameID = request.values.get('gameID')
    mycursor1 = db_connection.cursor()
    mycursor1.execute("SELECT `nickname`,`score`,`rank` FROM Player Where gID = %s", (gameID,))
    myresult1 = mycursor1.fetchall()
    mycursor1.close()
    return myresult1

@app.route('/getQuestion/', methods=['GET'])
def getQuestion():

    questionID = request.values.get('questionID')
    mycursor1 = db_connection.cursor()
    mycursor1.execute("SELECT `question`,`qType`,`latitude`,`longitude`,`score`,`feedback_right`,"
                      "`feedback_wrong` FROM Question Where QID = %s", (questionID,))

    myresult1 = mycursor1.fetchall()
    mycursor2 = db_connection.cursor()
    mycursor2.execute("SELECT `content`,`status` FROM Choice Where qID = %s ", (questionID,))
    myresult2 = mycursor2.fetchall()
    mycursor1.close()
    mycursor2.close()
    return myresult1+myresult2




if __name__ == '__main__':
    app.run(host='0.0.0.0', port=3000, debug=True)