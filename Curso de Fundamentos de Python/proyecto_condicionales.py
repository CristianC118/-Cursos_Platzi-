
# Juego Piedra - Papel o Tijera

user_option= input('Elige: piedra, papel o tijera: ').lower().strip()
computer_option= 'papel'

if user_option== computer_option:
  print('Empate.')

elif user_option== 'piedra':
  if computer_option== 'tijera':
    print('La piedra le gana a la tijera.')
    print('Gana el Usuario')
  
  else:
    print('El papel le gana a la piedra')
    print('La computadora gano.')

elif user_option== 'papel':
  if computer_option== 'piedra':
    print('El papel le gana a la piedra')
    print('Gano el usuario')

  else:
    print('La tijera le gana al papel')
    print('La computadora gano.')

elif user_option== 'tijera':
  if computer_option== 'papel':
    print('La tijera le gana al papel')
    print('Gana el Usuario')
  
  else:
    print('La piedra le gana a la tijera')
    print('La computadora gano.')