public static List<String> bag(List<List<Integer>> elements, Integer capacity) {
    Integer n = elements.size();
    List<List<Integer>> matriz = new List<List<Integer>>();

    for (Integer i = 0; i < n+1; i++) {
        List<Integer> row = new List<Integer>();
        for (Integer j = 0; j < capacity+1; j++) {
            row.add(0);
        }
        matriz.add(row);
    }

    for (Integer i = 1; i < n+1; i++) {
        for (Integer j = 1; j < capacity+1; j++) {
            Integer peso = elements[i-1][0];
            Integer value = elements[i-1][1];
            if (peso > j) {
                matriz[i][j] = matriz[i-1][j];
            } else {
                matriz[i][j] = Math.max(matriz[i-1][j], value + matriz[i-1][j-peso]);
            }
        }
    }

    Integer total_value = matriz[n][capacity];
    List<List<Integer>> best_elements = new List<List<Integer>>();
    Integer k = capacity;

    for (Integer i = n; i > 0; i--) {
        if (matriz[i][k] != matriz[i-1][k]) {
            best_elements.add(elements[i-1]);
            k -= elements[i-1][0];
        }
    }
    best_elements.reverse();

    List<List<Integer>> bad_elements = new List<List<Integer>>(elements);
    Integer bad_value = 0;

    for (List<Integer> out_elements : best_elements) {
        if (bad_elements.contains(out_elements)) {
            bad_elements.remove(out_elements);
        }
    }
    for (List<Integer> elements_bad_value : bad_elements) {
        Integer value_bad = elements_bad_value[1];
        bad_value += value_bad;
    }

    List<String> result = new List<String>();
    result.add('buenos elementos en la mochila: ' + best_elements + ', ' + total_value);
    result.add('Malos elementos en la mochila: ' + bad_elements + ', ' + bad_value);
    return result;
}
