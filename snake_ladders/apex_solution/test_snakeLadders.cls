@isTest
private class Test_gameSnakeLadders {

    @isTest
    static void test_rollDices(){
        Test.startTest();
        Game my_game = new GAME();
        Integer dado = game.roll_dices(1,6);
        Assert.isTrue(dado>=1 && dado<=6);
        Test.stopTest();
    }

    @isTest
    static void test_inputString() {
        Test.startTest();
        try {
            game_snake_ladder('hola');
            System.assert(false, 'Se esperaba una excepción de tipo ValorInválido');
        } catch (ValorInválido e) {
            System.assertEquals('Introduce un valor entero positivo', e.getMessage());
        }
        Test.stopTest();
    }

    @isTest
    static void test_inputIntNegativo() {
        Test.startTest();
        try {
            game_snake_ladder(-2);
            System.assert(false, 'Se esperaba una excepción de tipo ValorInválido');
        } catch (ValorInválido e) {
            System.assertEquals('Introduce un valor entero positivo', e.getMessage());
        }
        Test.stopTest();
    }

    @isTest
    static void test_inputList() {
        Test.startTest();
        try {
            game_snake_ladder([1,2,3,4]);
            System.assert(false, 'Se esperaba una excepción de tipo ValorInválido');
        } catch (ValorInválido e) {
            System.assertEquals('Introduce un valor entero positivo', e.getMessage());
        }
        Test.stopTest();
    }
}