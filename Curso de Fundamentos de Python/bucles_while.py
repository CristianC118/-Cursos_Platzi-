

# Bucle: while (mientras)

"""
  Ejemplo de bucle infinito
while True:
  print('Se Ejecuto')
"""

contador= 0 

while contador < 10:
  contador += 1
  print(contador)

print('----------------------------')

conter= 0

while conter < 10:
  conter += 1
  if conter== 8:
    break # break para un proceso
  print(conter)

print('----------------------------')

numero= 0 

while numero < 20:
  numero += 1
  if numero < 15:
    continue
  print(numero)