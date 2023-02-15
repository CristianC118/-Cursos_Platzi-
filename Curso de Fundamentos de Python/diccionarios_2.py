

person= {
  'name': 'cristian',
  'apellido': 'cristaldo',
  'lenguajes': ['Python', 'JavaScrip'],
  'age': 75
}

print(person)

# Cambiar valor
person['name']= 'Subaru'

# Editar valor
person['age'] -= 50

# agregar valor en una tupla del diccionario
person['lenguajes'].append('R')

# eliminar clave_valor
del person['apellido']

# eliminar clave_valor 2... necesita sí o sí un argumento
person.pop('age')

# imprimir items
print('items')
print(person.items())

# imprimir llaves
print('keys')
print(person.keys())

# imprimir valores
print('values')
print(person.values())