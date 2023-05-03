def bag(elements, capacity):

    #Se crea una Matriz de ceros donde las filas son el numero total de elementos de la lista de entrada y sus columnas son el total de la capacidad de la mochila
    n = len(elements)
    matriz = [[0 for j in range(capacity+1)] for i in range(n+1)]
    
    #Se extrane los numeros de peso y valor del elemento y deacuerdo a su peso se almacenan en la matriz los valores de los mismos en orden, ademas de sumar su valor hasta que el peso es superado
    for i in range(1, n+1):
        for j in range(1, capacity+1):
            peso, value = elements[i-1]
            if peso > j:
                matriz[i][j] = matriz[i-1][j]
            else:
                matriz[i][j] = max(matriz[i-1][j], value + matriz[i-1][j-peso])
    
    # Se extrae de la matriz el valor adeduado de la matriz
    total_value = matriz[n][capacity]
    best_elements = []
    k = capacity

    # Se comparan el estado presente vs el anterior de la matriz y si son diferentes se agrega el valor anterior de la matriz a la lista de mejores elementos de salida
    for i in range(n, 0, -1):
        if matriz[i][k] != matriz[i-1][k]:
            best_elements.append(elements[i-1])
            k -= elements[i-1][0]
    best_elements.reverse()

    bad_elements = elements
    bad_value = 0

    for out_elements in best_elements:
        if out_elements in bad_elements:

            bad_elements.remove(out_elements)

    for elements_bad_value in bad_elements:
        _, value_bad = elements_bad_value
        bad_value += value_bad 
    
    return f'buenos elementos en la mochila: {best_elements, total_value}', f'Malos elementos en la mochila {bad_elements, bad_value}'

