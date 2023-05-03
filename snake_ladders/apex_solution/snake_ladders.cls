import System.Random;


public class Game{

    public GAME(){
        game_snake_ladder(2);
    }


    public class Player {
        public String player_name;
        public Integer position;

        public Player() {
            player_name = '';
            position = 1;
        }
    }

    public Integer roll_dices(Integer min, Integer max) {
        Integer dices = (new Random()).Next(min, max+1);
        return dices;
    }

    public List<Player> list_players(Integer num_players) {
        List<Player> list_player = new List<Player>();
        for (Integer i = 1; i <= num_players; i++) {
            Player player = new Player();
            player.player_name = 'Player' + i;
            list_player.add(player);
        }

        return list_player;
    }

    public void game_snake_ladder(Integer num_players) {

        if (num_players <= 0) {
            throw new Exception('Introduce un valor entero positivo');
        }

        if (num_players instanceof List) {
            throw new Exception('Introduce un valor entero positivo');
        }

        if (num_players instanceof Boolean) {
            throw new Exception('Introduce un valor entero positivo');
        }

        if (num_players instanceof Tuple) {
            throw new Exception('Introduce un valor entero positivo');
        }

        List<Player> players_list = list_players(num_players);
        Map<Integer, Integer> snake_ladder = new Map<Integer, Integer>{3 => 5, 6 => 2, 8 => 12, 10 => 5, 12 => 18, 16 => 20, 17 => 9, 22 => 25, 23 => 15};
        Integer ronda = 1;
        Integer turno = 0;
        Boolean winner = false;

        while (!winner) {

            if (turno == num_players) {
                turno = 0;
            }

            //Desicion comentario Inicial
            if (ronda == 1) {
                System.debug('Empieza el juego, estamos en la ronda: ' + ronda);
            } else {
                System.debug('estamos en la ronda: ' + ronda);
            }

            //Lanzamiento de dados
            System.debug('Tira los dados el jugador ' + players_list[turno].player_name);
            Integer dices = roll_dices(1,6);
            System.debug('El ' + players_list[turno].player_name + ' lanzo los dados y saco: ' + dices);

            //Actualizacion de la posicion del judor
            players_list[turno].position += dices;

            //comprobacion de posicion
            if (players_list[turno].position > 25) {
                System.debug('Sacaste un valor de dados que supera la posicion de ganador, pierdes el turno');
                players_list[turno].position -= dices;
            }

            System.debug('El ' + players_list[turno].player_name + ' sube de posicion a: ' + players_list[turno].position);

            if (snake_ladder.containsKey(players_list[turno].position)) {
                Integer new_position = snake_ladder.get(players_list[turno].position);

                if (players_list[turno].position < new_position) {

                    players_list[turno].position = new_position;
                    System.debug('el ' + players_list[turno].player_name + ' sube por una escalera');

                } else if (players_list[turno].position > new_position) {

                    players_list[turno].position = new_position
                    System.debug('el ' + players_list[turno].player_name + ' cae por una cabeza de serpiente');
                }
            }

            System.debug('la nueva posicion del' + players_list[turno].player_name + ' es: ' + players_list[turno].position);

            if (players_list[turno].position == 25){
                winner = true;
                System.debug('el ganador del juego es' + players_list[turno].player_name);
            }else{
                ronda++;
                turno++;
            }

        }
    }
}