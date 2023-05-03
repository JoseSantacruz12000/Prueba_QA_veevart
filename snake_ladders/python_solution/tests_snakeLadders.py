import unittest
from snake_ladders import roll_dices, game_snake_ladder

class Test_gameSnakeLadders(unittest.TestCase):
    def test_rollDices(self):
        for i in range(0,1000):
            dices = roll_dices(1,6)
        self.assertTrue(dices <= 6 and dices >= 1)

    def test_inputString(self):
        with self.assertRaises(ValueError) as exc:
            game_snake_ladder('hola')
        self.assertEqual(str(exc.exception), 'Introduce un valor entero positivo')
        
    
    def test_inputIntNegativo(self):
        with self.assertRaises(ValueError) as exc:
            game_snake_ladder(-2)
        self.assertEqual(str(exc.exception), 'Introduce un valor entero positivo')
        
    
    def test_inputList(self):
        with self.assertRaises(ValueError) as exc:
            game_snake_ladder([1,2,3,4])
        self.assertEqual(str(exc.exception), 'Introduce un valor entero positivo')
        
    #ejemplo identificando la salida como valor no como type
    def test_inputTuple(self):
        with self.assertRaises(ValueError) as exc:
            game_snake_ladder(tuple([1,2,3,4]))
        self.assertEqual(str(exc.exception), 'Introduce un valor entero positivo')
            

if __name__ == '__main__':
    unittest.main()      