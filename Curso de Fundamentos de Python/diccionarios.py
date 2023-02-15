

dicc= {'name': 'Cristian', 'apellido': 'Cristaldo', 'age': 25}
print(dicc)

# Longitud
print(len(dicc))

# imprime valor
print(dicc['age']) # Error si no existe el elemento

# imprime valor 2
print(dicc.get('inexistente')) # mejor para averiguar si un elemento existe o no

print('name' in dicc)