### Adivina el número (juego)

"""Crear un programa en el que el usuario deberá adivinar el número que la máquina escogió. 
Deben utilizar la librería `random` para generar la elección de la máquina. 
El usuario tendrá 5 vidas, cada vez que intente adivinar, recibirá como respuesta “El número es mayor” o “El número es menor” según corresponda, 
y perderá una vida. Ganará cuando logre adivinar el número elegido por la máquina."""

import random
numero_base = 1
numero_tope = 20
numero_aleatorio = random.randint(numero_base, numero_tope)  # Genera un número entero aleatorio entre 1 y 10
numero_usuario = 0
intentos = 4

while (numero_aleatorio != numero_usuario and intentos != 0):
    
    if(numero_usuario == 0):
        numero_usuario = int(input(f"Ingresa el numero ganador (entre {numero_base} y {numero_tope}): "))
    elif (numero_aleatorio > numero_usuario and intentos != 0):
        numero_usuario = int(input(f"No mi pana! El numero es mayor \nTe quedan {intentos} intentos \nIngresalo otra vez: "))
        intentos -= 1
    elif(numero_aleatorio < numero_usuario and intentos != 0):
        numero_usuario = int(input(f"No mi broder! El numero es menor \nTe quedan {intentos} intentos \nIngresalo otra vez: "))
        intentos -= 1
        
if(numero_aleatorio == numero_usuario and intentos != 0):
    print(f"Ganaste reeeeey!! Con {intentos} intentos de sobra, sos crack")
elif(intentos == 0):
    print(f"Perdiste... desafortunado en el juego pero afortunado en el amor")
    print(f"El numero era el {numero_aleatorio}")
        