import random

class Player():
    def __init__(self):
        self.player_name = ''
        self.position = 1

def roll_dices(min, max):
    dices = random.randint(int(min), int(max))
    return dices

def list_players(num_players):
    list_player = []
    for i in range(1, num_players+1):
        player = Player()
        player.player_name = f'Player{i}'
        list_player.append(player)

    return list_player

def game_snake_ladder(num_players):

    if type(num_players) is str:
        raise ValueError('Introduce un valor entero positivo')
    
    if type(num_players) is int and num_players < 0:
        raise ValueError('Introduce un valor entero positivo')
    
    if type(num_players) is list:
        raise ValueError('Introduce un valor entero positivo')
    
    if type(num_players) is bool:
        raise ValueError('Introduce un valor entero positivo')
    
    if type(num_players) is tuple:
        raise ValueError('Introduce un valor entero positivo')


    players_list = list_players(num_players)
    snake_ladder = {3:5, 6:2, 8:12, 10:5, 12:18, 16:20, 17:9, 22:25, 23:15}
    ronda = 1
    turno = 0
    winner = False

    while not winner:

        if turno == num_players:
            turno = 0

        #Desicion comentario Inicial
        if ronda == 1:
            print(f'Empieza el juego, estamos en la ronda: {ronda}')
        else:
            print(f'estamos en la ronda: {ronda}')
        
        #Lanzamiento de dados
        print(f'Tira los dados el jugador {players_list[turno].player_name}')
        input('presiona enter para lanzar los dados')
        dices = roll_dices(1,6)
        print(f'El {players_list[turno].player_name} lanzo los dados y saco: {dices}')

        #Actualizacion de la posicion del judor
        players_list[turno].position += dices
        
        #comprobacion de posicion
        if players_list[turno].position > 25:
            print('Sacaste un valor de dados que supera la posicion de ganador, pierdes el turno')
            players_list[turno].position -= dices
        
        print(f'El {players_list[turno].player_name} sube de posicion a: {players_list[turno].position}')

        if players_list[turno].position in snake_ladder:
            new_position = snake_ladder[players_list[turno].position]

            if players_list[turno].position < new_position:
                
                players_list[turno].position = new_position
                print(f'el {players_list[turno].player_name} sube por una escalera')


            elif players_list[turno].position > new_position:
                
                players_list[turno].position = new_position
                print(f'el {players_list[turno].player_name} baja por una zabeza de serpiente')
        
        print(f'la nueva posicion del {players_list[turno].player_name} es: {players_list[turno].position}')

        #Condicion de Ganador
        if players_list[turno].position == 25:
            winner = True
            print(f'El ganador del juego es {players_list[turno].player_name}')
        else:

            input('presiona enter pa continuar a la siguiente ronda')
            turno +=1   
            ronda +=1