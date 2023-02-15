

x= 3.3 # 3.3
print(x)

y= 1.1 + 2.2 # 3.3000000000000003
print(y)

print(x == y) # False

# transformar a formato str y cortar valores pero queda en formato str
y_str= format(y, '.2g')
print('str=>', y_str)
print(y_str== str(x))

print('---------------------------')

# forma matemática con margen de tolerancia
print(y, x)

tolerancia= 0.00001
print(abs(x - y)< tolerancia)