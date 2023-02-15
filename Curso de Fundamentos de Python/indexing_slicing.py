

# Indexación
text= 'Ella sabe Python'
print(text[2])

# Devuelve el último caracter
print(text[-1])

size= len(text)
# Devuelve la cantidad total de caracteres
print('SIZE ->', size)
# Forma Dos (más larga :v)
print(text[size - 1])


# slicing
print(text[0:6])
print(text[10:16])

print(text[5:- 0])

# Salto de caracteres
print(text[10:16:1])
print(text[10:16:2])
print(text[::2])

# Poner las palabras al reves
text= 'Ella sabe Python'
print(text[::-1])