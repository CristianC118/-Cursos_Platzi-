

print(not True) # = False
print(not False) # = True

# not 
print('NOT AND')
print('not True and True =>', not (True and True)) # False
print('not True and False =>', not (True and False)) # True
print('not False and True =>', not (False and True)) # True
print('not False and False =>', not (False and False)) # True

stock= int(input('Ingrese el numero de stock =>'))
print(not(stock >= 100 and stock <= 1000))


"""
  AND

True and True= True
True and False= False
False and True= False
False and False= False
"""

"""
  OR

True and True= True
True and False= True
False or True= True
False or False= False
"""

"""
  NOT

not True= False
not False= True
"""