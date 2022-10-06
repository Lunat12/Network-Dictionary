import socket
import mysql.connector 

menu = False
state = True
language = "1"

#region connect to data base

conection = mysql.connector.connect( host='localhost',
                                            database ='WebAcronyms', 
                                            user = 'root',
                                            password ='')
cur = conection.cursor()

# endregion

languages = {"0": "es_phrase", "1": "en_phrase"}

def Option1(_message):
    cur.execute("SELECT {} FROM ProgramText WHERE id_phrase = 20".format(languages[language]))
    a = cur.fetchall()[0][0]

    cur.execute("SELECT {} FROM ProgramText WHERE id_phrase = 21".format(languages[language]))
    b = cur.fetchall()[0][0]

    option_id = input("\n{}\t{} \n\t{} ".format(a,_message,b))
    if option_id.isdigit(): 
        return option_id.encode()
    else: 
        cur.execute("SELECT {} FROM ProgramText WHERE id_phrase = 3".format(languages[language]))
        print(f"\n{cur.fetchall()[0][0]}")
        return Option1(_message)


def Option2(_message):
    cur.execute("SELECT {} FROM ProgramText WHERE id_phrase = 4".format(languages[language]))
    print(f"\n{cur.fetchall()[0][0]} {_message}")

    cur.execute("SELECT {} FROM ProgramText WHERE id_phrase = 5".format(languages[language]))
    acro = str(input(f"{cur.fetchall()[0][0]} ")).upper()

    if acro.isdigit(): 
        cur.execute("SELECT {} FROM ProgramText WHERE id_phrase = 6".format(languages[language]))
        print(f"\n{cur.fetchall()[0][0]}.")
        Option2(_message)
    else: 
        return acro.encode()


def Continue():
    cur.execute("SELECT {} FROM ProgramText WHERE id_phrase = 70".format(languages[language]))
    a = cur.fetchall()[0][0]

    cur.execute("SELECT {} FROM ProgramText WHERE id_phrase = 71".format(languages[language]))
    b = cur.fetchall()[0][0]

    response = str(input(f"\n{a}\n\n{b}")).upper() == "N"
    
    if response:
        global menu
        menu = False
        return "N".encode()
    return "Y".encode()

def Menu():
    global state

    cur.execute("SELECT {} FROM ProgramText WHERE id_phrase = 80".format(languages[language]))
    a = cur.fetchall()[0][0]

    cur.execute("SELECT {} FROM ProgramText WHERE id_phrase = 81".format(languages[language]))
    b = cur.fetchall()[0][0]

    cur.execute("SELECT {} FROM ProgramText WHERE id_phrase = 82".format(languages[language]))
    c = cur.fetchall()[0][0]

    cur.execute("SELECT {} FROM ProgramText WHERE id_phrase = 83".format(languages[language]))
    d = cur.fetchall()[0][0]

    cur.execute("SELECT {} FROM ProgramText WHERE id_phrase = 84".format(languages[language]))
    e = cur.fetchall()[0][0]

    option_id = input(f"\n{a}\n\t{b}\n\t{c}\n\t{d}\n\t{e}")
    if option_id == "1":
        state = True
        return "1".encode()
    elif option_id == "2":
        state = False
        return "2".encode()
    else:
        return "3".encode()

def language():
    lan = input("Select language:\n\t0-Spanish\n\t1-English\n\tChoice: ")
    if lan.isdigit():
        if lan in languages.keys():
            global language 
            language = lan
        return lan.encode()
    return language()


clientSocket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

serverAdress = ("localhost", 4000)

clientSocket.connect(serverAdress)

print("\nI've connected to Server {} on port {}".format(*serverAdress))

try:

    clientSocket.sendall(language())

    while True:
        messageRecived = clientSocket.recv(1024)
        messageRecived = messageRecived.decode()

        if menu:

            if messageRecived == "2":
                break

            if messageRecived == "0":
                clientSocket.sendall(Continue())

            elif state:
                menu = False
                clientSocket.sendall(Option1(messageRecived))

            elif not state:
                clientSocket.sendall(Option2(messageRecived))
            

        else:
            if messageRecived == "1":
                menu = True
                clientSocket.sendall(Menu())

            else:
                print("\n" + messageRecived)
                clientSocket.sendall("N".encode())

        

        
        #cuando no envie nada manda una N
finally:
    clientSocket.close()
