

name= 'Subaru'
last_name= 'Hoshizora'
age= 25
print(name)
print(last_name)

full_name= name + ' ' + last_name
print(full_name)

quote= "I'm Subaru"
print(quote)

quote2= 'She said "Hello"'
print(quote2)

# format
template1= 'Hi!, my name is ' + name + ' and my last name is ' + last_name
print('v1_', template1)

template2= 'Hi!, my name is {} and my last name is {}'.format(name, last_name)
print('v2_', template2)

template3= f'Hi!, my name is {name} and my last name is {last_name}'
print('v3_', template3)

template4= f'Hi!, my name and last name is {name} {last_name} and my age is {age}.'
print('v4_', template4)