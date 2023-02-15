

if True:
  print('Debería ejecutarse')

if False:
  print('Nunca se ejecuta')



pet= input('¿Cuál es tu mascota favorita?: ')

if pet== 'gato':
  print('Sí tienes un gato, tienes buen gusto')

elif pet== 'perro':
  print('Increible!')

elif pet== 'pez':
  print('Genial!')

else:
  print('No tienes ninguna mascota interesante')



stock= int(input('Digita el stock: '))

if stock >= 100 and stock <= 1000:
  print('El stock es correcto')

else:
  print('El stock es incorrecto')


#---------------------------------------------------------------
# Reto: crea un programa que evalue si un número es par o impar.
#---------------------------------------------------------------

# N° 1
numero= int(input('Introduce un número par: '))

if numero % 2== 0:
  print(f'El número {numero} es un número par')

else:
  print(f'El número {numero} es un número impar')

# N° 2
number = int(input('Ingrese un numero => '))
result = number % 2
if (result == 0):
	print('Es par')
else:
	print('Es impar')