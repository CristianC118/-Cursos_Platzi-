

# Juego Piedra - Papel o Tijera

import random

opciones= ('piedra', 'papel', 'tijera')

computadora_win= 0
usuario_win= 0
rondas= 1

while True:
  print('--------------------')
  print('Round', rondas)
  print('--------------------')

  print('🤖 computadora_win', computadora_win)
  print('🙋 usuario_win', usuario_win)

  opcion_usuario= input('Elige: piedra, papel o tijera: ').lower().strip()
  
  rondas += 1

  if not opcion_usuario in opciones:
    print('Esa opción no es valida')
    continue

  opcion_computadora= random.choice(opciones)

  print('User option:', opcion_usuario)
  print('Computer option:', opcion_computadora)

  if opcion_usuario== opcion_computadora:
    print('Empate.')

  elif opcion_usuario== 'piedra':
    if opcion_computadora== 'tijera':
      print('La piedra le gana a la tijera.')
      print('Gana el Usuario 🙋')
      usuario_win += 1
    
    else:
      print('El papel le gana a la piedra')
      print('Gano la computadora🤖')
      computadora_win += 1

  elif opcion_usuario== 'papel':
    if opcion_computadora== 'piedra':
      print('El papel le gana a la piedra')
      print('Gano el usuario 🙋')
      usuario_win += 1

    else:
      print('La tijera le gana al papel')
      print('Gano la computadora🤖')
      computadora_win += 1

  elif opcion_usuario== 'tijera':
    if opcion_computadora== 'papel':
      print('La tijera le gana al papel')
      print('Gana el Usuario 🙋')
      usuario_win += 1
    
    else:
      print('La piedra le gana a la tijera')
      print('Gano la computadora🤖')
      computadora_win += 1

  if computadora_win== 3:
    print('La computadora gano el juego. 🤖')
    break

  if usuario_win== 3:
    print('El usuario gano el juego. 🙋')
    break