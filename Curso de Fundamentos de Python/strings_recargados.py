
# in (Verifica si un caracter es valido o esta dentro)

text= 'Ella sabe programar en Python'


print('JavaScript' in text)
print('Python' in text)

if 'Python' in text:
  print('Elegiste Bien')

else:
  print('También elegiste bien')


# len (longitud: cuenta caracteres/espacios)
size= len('love you')
print(size)

# Pasa a mayúsculas
print(text.upper())

# Pasa a minúsculas
print(text.lower())

# Contar número de letras
print(text.count('a'))

# Pasa las mayúsculas a minúsculas y al reves 
print(text.swapcase())

# Responde con Booleanos sí comienza con...
print(text.startswith('Ella'))

# Responde con Booleanos sí termina con...
print(text.endswith('Rust'))

# Reemplaza caracteres
print(text.replace('Python', 'R'))

text2= 'este es un titulo'
print(text2)

# Cambia el primer caracter a mayúscula
print(text2.capitalize())

# Cambia el inicio de cada palabra en mayúscula
print(text2.title())

# Evalua si el caracter es un digito
print(text2.isdigit())
print('398'.isdigit())

# .strip() Elimina los espacios en blanco iniciales y finales

#-------------------------------------------------
# Reto: transformar input del usuario a minúscula. ☑
#-------------------------------------------------