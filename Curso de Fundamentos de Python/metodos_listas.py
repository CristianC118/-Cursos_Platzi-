

# CRUD: Create, Read, Update y Delete

numberss= [1, 2, 3, 4, 5]
print(numberss[1]) # Devuelve 2

# Cambia el valor de la última posición a 10
numberss[-1]= 10
print(numberss)

# Insertar valores al final de la lista
numberss.append(700)
print(numberss)

# Insertar valores en cualquier posición de la lista
numberss.insert(0, 'hola')
print(numberss)

numberss.insert(3, 'change')
print(numberss)

# Unir listas
tasks= ['todo 1', 'todo 2', 'todo 3']
nueva_lista= numberss + tasks
print(nueva_lista)

# Index de la lista
print(nueva_lista.index('todo 2'))

# indexar una posición
index= nueva_lista.index(('todo 2'))
nueva_lista[index]= 'todo 2 changed'
print(nueva_lista)

# eliminar elementos
nueva_lista.remove('todo 1')
print(nueva_lista)

# eliminar el último elemento de la lista
nueva_lista.pop()
print(nueva_lista)

# eliminar la posición específica de un elemento
nueva_lista.pop(0)
print(nueva_lista)

# cambia todo al reverso la lista
nueva_lista.reverse()
print(nueva_lista)

# ordena la lista
# pero no se puede ordenar una lista de str e int a la vez
numeros= [1, 4, 5, 6, 3]
numeros.sort()
print(numeros)

letras= ['re', 'ab', 'ed']
letras.sort()
print(letras)