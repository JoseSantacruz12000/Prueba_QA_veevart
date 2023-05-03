# PROGRAMACION EN SALEFORCE
## DE QUE SE TRATA 
En esta carpeta se encuentra la programacion en lenguaje apex saleforce del juego de mesa serpientes y escaleras, el jugador llama a la clase del juego, se digita el numero de jugadores y comienza el juego, el jugador que primero llega a 25 gana y al mismo tiempo se cierra el juego 
## COMO EJECUTARLO
Teniendo los archivos que se encuentran en esta carpeta lo unico que se debe hacer es ejecutarlo en el playgroun de saleforce  selecciona Debug y despues "Open Execute Anonymous Window", al desplegar la ventana emergente se debe escribir el comando de ejecucion que es "Game my_game = new GAME(2);" eso llamara al constructor, y ejecutara el juego.
## TEST
De la misma forma que en la version de python se realizaron 4 testeos el primero se encarga de probar la funcion de dados la cual su resultado no debe salirse del siguiente interbalo (1,6), las siguientes se encargan de evaluar el error que se produce cuando se ingresa un valor diferente a un entero positivo en la funcion del juego 