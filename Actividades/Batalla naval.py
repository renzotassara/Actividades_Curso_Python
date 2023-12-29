### Batalla naval

"""Crear un programa que permita jugar la batalla naval entre dos jugadores.
Cada uno debe ubicar un barco que contiene 3 secciones. 
Luego cada jugador tira una bomba por turno indicando la posición en x y la posición en y. 
Si acierta, esa sección del barco queda destruida y se muestra un mensaje por pantalla. 
Gana el jugador que logre destruir el barco completo del rival."""
#---Constantes---
filas = 10  #Cantidad de filas que tendra el tablero -1 (o sea, si pongo 9, la cantidad de filas que tendra el tablero sera de 10)
columnas = 10    #Cantidad de columnas que tendra el tablero -1 (o sea, si pongo 9, la cantidad de columnas que tendra el tablero sera de 10)
tamanio_barcos = (3,5)   #Tengo barcos con longitudes de 3 y 5 unidades. Deben ser barcos con logitudes impares
cant_barcos = (2,1)  #Cantidad de barcos que tendre respectivamente
barcos = []
for i in range(len(tamanio_barcos)):
    for _ in range(cant_barcos[i]):
        barcos.append(tamanio_barcos[i])    #Creo lista la cual figura cantidad de cada barco
vivos = 0  #Inicializacion de lista la cual indica cantidad de espacios vivos
muertos = [0,0]
simboloBarcoVivo = "O"  #Puedo personalizar los simbolos del juego
simboloBarcoMuerto = "X"
simboloElementoTablero = "-"
simboloAgua = "@"
vector_matriz = []  #Para luego crear matriz de juego
tablero = []    #matriz de juego
ubicacion_fila = []
ubicacion_columna = []
numeroAUX = 0   #Inicializacion de numero el cual permitira tener una mejor visualizacion del tablero
misil_fila = 0  #Inicializacion de variables de ataque
misil_columna = 0
jugador = 2 #Inicializacion de variable para determinar los turnos de ataque
orientacion = []    #Indica orientacion del barco (vertical u horizontal)

while (len(tamanio_barcos) != len(cant_barcos)):
    print("Error al ingresar cantidad y tamaño de barcos, deben ser vectores con longitudes iguales. Reiniciar codigo")
    
#Creo matriz tridimesional la cual contendra los tableros de ambos jugadores
tablero = [[[simboloElementoTablero for _ in range(filas)] for _ in range(columnas)] for _ in range(2)] 
tablero_registro_ataque = [[[simboloElementoTablero for _ in range(filas)] for _ in range(columnas)] for _ in range(2)] 

for j in range(0,2):    #Cada jugador coloca los barcos donde quiera
    for i in range(0, len(barcos)):
        
        error = int((barcos[i]-1)/2)    #Cuantos elementos vivos hay a partir del centro
        ubicacion_fila.append(0)     #Agrego valor a la lista para luego sobreescribirlo (no se por que lo hice con una lista, lo podria haber hecho con variables simples)
        ubicacion_columna.append(0)
        orientacion.append(0)
        ubicacion_fila[i] = int(input(f"Jugador Nº{j+1}, ingrese en que fila quiere colocar el centro del {i+1}º barco de tamaño 3: "))-1        #Ubico centro de barco
        ubicacion_columna[i] = int(input(f"Jugador Nº{j+1}, ingrese en que columna quiere colocar el centro del {i+1}º barco de tamaño 3: "))-1
        
        orientacion[i] = int(input(f"Jugador Nº{j+1}, ingrese que orientacion quiere que tenga el {i}º barco de tamaño 3 (1 = horizontal / 0 = vertical): "))   #Orientacion de barco (Cambiarlo por variable booleana)
        
        while(orientacion[i] != 0 and orientacion[i] != 1):    #Corrige error de orientacion ingresado por el usuario
            orientacion[i] = int(input(f"Orientacion invalida, ingrese 0 o 1: "))
            
        #Errores por si el usuario ingresa posiciones del barco tal que quede alguna parte fuera del tablero
        while (orientacion[i] == 0 and (ubicacion_fila[i] >= filas-error or ubicacion_fila[i] <= error-1 or ubicacion_columna[i] < 0 or ubicacion_columna[i] > columnas)):
            print(f"El tamaño del tablero es de {filas}x{columnas}")
            ubicacion_fila[i] = int(input(f"Ingresar nuevamente ubicacion de fila ya que el barco se encuenta fuera de los limites del tablero: "))-1
            ubicacion_columna[i] = int(input(f"Ingresar nuevamente ubicacion de columna ya que el barco se encuenta fuera de los limites del tablero: "))-1
        while (orientacion[i] == 1 and (ubicacion_fila[i] > filas or ubicacion_fila[i] < 0 or ubicacion_columna[i] <= error-1 or ubicacion_columna[i] >= columnas-error)):
            print(f"El tamaño del tablero es de {filas}x{columnas}")
            ubicacion_fila[i] = int(input(f"Ingresar nuevamente ubicacion de fila ya que el barco se encuenta fuera de los limites del tablero: "))-1
            ubicacion_columna[i] = int(input(f"Ingresar nuevamente ubicacion de columna ya que el barco se encuenta fuera de los limites del tablero: "))-1
        
        #Errores por si el usuario ingresa valores tales que se superponga barcos
        if (orientacion[i] == 0):
            for k in range(-error,error+1):
                while (tablero[j][ubicacion_fila[i]+k][ubicacion_columna[i]] == simboloBarcoVivo):
                    ubicacion_fila[i] = int(input(f"Ingresar nuevamente ubicacion de fila ya que el barco se superpone con otro: "))-1
                    ubicacion_columna[i] = int(input(f"Ingresar nuevamente ubicacion de columna ya que el barco se superpone con otro: "))-1
        
            for k in range(-error,error+1):
                tablero[j][ubicacion_fila[i]+k][ubicacion_columna[i]] = simboloBarcoVivo
        
        elif (orientacion[i] == 1):
            for k in range(-error,error+1):
                while (tablero[j][ubicacion_fila[i]][ubicacion_columna[i]+k] == simboloBarcoVivo):
                    ubicacion_fila[i] = int(input(f"Ingresar nuevamente ubicacion de fila ya que el barco se superpone con otro: "))-1
                    ubicacion_columna[i] = int(input(f"Ingresar nuevamente ubicacion de columna ya que el barco se superpone con otro: "))-1
                
            for k in range(-error,error+1):
                tablero[j][ubicacion_fila[i]][ubicacion_columna[i]+k] = simboloBarcoVivo
                    
        # Imprimir la matriz de forma ordenada
        for i in range(0,columnas+1):   #Numeros para guiarse con las columnas
            print(i, end="  ")
        print()
        for fila in tablero[j]:
            numeroAUX += 1
            if 0 <= numeroAUX <= 9: #Numeros para guiarse con las filas
                print(f"{numeroAUX}",end="   ")
            else:
                print(f"{numeroAUX}",end="  ")
            for elemento in fila:
                print(elemento, end="  ")  # Mostrar el elemento seguido de un espacio en la misma línea
            print()
        numeroAUX = 0
for fila in tablero[0]:  #Cuento la cantidad de elementos vivos para luego porder comparar en el while que sigue
    vivos = vivos + fila.count(simboloBarcoVivo)
            
print(f"\n QUE EMPIECE EL JUEGO \n")
print(f"Cantidad de vivos = {vivos}")

while (muertos[0] < vivos and muertos[1] < vivos):
    jugador += 1
    if jugador > 2:
        jugador = 1
    
    print(f"   Tablero barcos Jugador {jugador}")   #Permite que el jugador actual pueda ver su tablero
    for i in range(0,columnas+1):   #Numeros para guiarse con las columnas
        print(i, end="   ")
    print()
    for fila in tablero[jugador-1]:
        numeroAUX += 1
        if 0 <= numeroAUX <= 9: #Numeros para guiarse con las filas
            print(f"{numeroAUX}",end="   ")
        else:
            print(f"{numeroAUX}",end="  ")
        for elemento in fila:
            print(elemento, end="  ")  # Mostrar el elemento seguido de un espacio en la misma línea
        print()
    numeroAUX = 0
    print(f"\n  Tablero Registro de ataques Jugador {jugador}") #Tablero el cual permite al jugador actual ver el historial de sus ataques
    for i in range(0,columnas+1):   #Numeros para guiarse con las columnas
        print(i, end="   ")
    print()
    for fila_registro in tablero_registro_ataque[jugador-1]:
        numeroAUX += 1
        if 0 <= numeroAUX <= 9: #Numeros para guiarse con las filas
            print(f"{numeroAUX}",end="   ")
        else:
            print(f"{numeroAUX}",end="  ")
        for elemento in fila_registro:
            print(elemento, end="  ")  # Mostrar el elemento seguido de un espacio en la misma línea
        print()
    numeroAUX = 0
    
    misil_fila = int(input(f"Turno de jugador Nº{jugador} \n Ingrese fila donde quiera atacar: "))  #Donde va a atacar el jugador
    misil_columna = int(input(f"Ingrese columna donde quiera atacar: "))
    
    if jugador == 1:
        contrincante = 2
    else:
        contrincante = 1
        
    if (tablero[contrincante-1][misil_fila-1][misil_columna-1] == simboloElementoTablero):
        print(f"\nAGUA!")
        tablero_registro_ataque[jugador-1][misil_fila-1][misil_columna-1] = simboloAgua
    elif(tablero[contrincante-1][misil_fila-1][misil_columna-1] == simboloBarcoVivo):
        print(f"\nIMPACTO!")
        tablero_registro_ataque[jugador-1][misil_fila-1][misil_columna-1] = simboloBarcoMuerto
        
    muertos[jugador-1] = 0
    for fila in tablero_registro_ataque[jugador-1]:  
        muertos[jugador-1] = muertos[jugador-1] + fila.count(simboloBarcoMuerto)
    print(f"Cantidad de muertos actuales de jugador contrario = {muertos[jugador-1]}")
        

    
print(f"JUGADOR {jugador} ha ganado!")
print(f"JUGADOR CONTRINCANTE, VAYA A LLORAR A LA LLORERIA")
