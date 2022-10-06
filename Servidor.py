
import random
import socket 
import mysql.connector 


# region variables

menu = True
language = "1"
currentID = 0


# endregion

languages = {"0": ["es_Definition", "es_phrase"], "1":["en_Definition", "en_phrase"]}

#region connect to data base

conection = mysql.connector.connect( host='localhost',
                                            database ='WebAcronyms', 
                                            user = 'root',
                                            password ='')
cur = conection.cursor()

# endregion

def Option1():

    message = ""
    cur.execute("SELECT id_acro, Acronym FROM Definitions")
    for id_acro, Acronym in cur.fetchall():
        message += "\n\t{}-{}".format(id_acro, Acronym)

    return message.encode()


def findIds(_ids):
    cur.execute("SELECT id_acro FROM Definitions")
    ids = cur.fetchall()

    for tupla in ids:
        if _ids in ids[ids.index(tupla)]:
            return True
    return False


def Option1Response(_message):
    _message = int(_message)

    if findIds(_message):
        cur.execute("SELECT {} FROM Definitions WHERE id_acro = {}".format(languages[language][0], _message))
        definition = cur.fetchall()
        return definition[0][0].encode()
    cur.execute("SELECT {} FROM ProgramText WHERE id_phrase = 1".format(languages[language][1]))
    error1 = "\n" + cur.fetchall()[0][0]
    return error1.encode()


def Option2():
    global currentID
    cur.execute("SELECT {} FROM Definitions".format(languages[language][0]))
    definition = cur.fetchall()
    while True:
        currentID = random.randint(0, len(definition)-1)
        if findIds(currentID + 1):
            break
    return definition[currentID][0].encode()



def Option2Response(_message):
    cur.execute("SELECT Acronym FROM Definitions WHERE id_acro = {}".format(currentID + 1))
    acronym = cur.fetchall()
    if acronym[0][0] == _message:
        return "0".encode()
    return Option2()


def Menu():

    return "1".encode()

def changeLenguage(_message):
    if _message in languages.keys():
        global language
        language = str(_message)


serverSocket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

serverAdress = ("localhost", 4000)

serverSocket.bind(serverAdress)

serverSocket.listen()

print("\nServer {} connected to port {}".format(*serverAdress))

while True:
    
    print("\nWaiting for new client...")
    con, clientAdress = serverSocket.accept()
    try:
        print("\nHas connected to client  ", clientAdress)
        message = con.recv(1024)
        message = message.decode()

        changeLenguage(message)

        con.sendall(Menu())
        while True:

            message = con.recv(1024)
            message = message.decode()

            if menu:
                menu = False

                if message == "1":
                    con.sendall(Option1())

                elif message == "2":
                    con.sendall(Option2())

                else:
                    con.sendall("2".encode())
                    menu = True
                    break
            
            else:
                if message.isnumeric():
                    con.sendall(Option1Response(message))
                elif message == "Y":
                    con.sendall(Option2())
                elif message == "N":
                    menu = True
                    con.sendall(Menu())
                else:
                    con.sendall(Option2Response(message))

        
        
        
    finally:
        con.close()
        

