

for elemento in range(20):
  elemento += 1
  print(elemento, end=' ')

print('\n----------------------')

lista= [23, 45, 67, 89, 43]

for i in lista:
  print(i)

print('----------------------')

tupla= ('nico', 'subaru', 'cristian')

for i in tupla:
  print(i)

print('----------------------')

dicc= {
  'name': 'camisa',
  'precio': 100,
  'stock': 89,
}

for clave in dicc:
  print(clave) # Imprime solo Clave

for valor in dicc:
  print(dicc[valor]) # Imprime solo valor

for clave_valor in dicc:
  print(clave_valor,dicc[clave_valor])# Imprime clave_valor

for key, valuee in dicc.items():
  print(key, valuee) # De esta forma también imprime clave_valor

print('----------------------')

personas= [
  {
    'name': 'Subaru',
    'age': 25
  },
  {
    'name': 'Cristian',
    'age': 25
  },
  {
    'name': 'Seu',
    'age': 24
  }
]

for i in personas:
  print(i)

for i in personas:
  print(i['name'])