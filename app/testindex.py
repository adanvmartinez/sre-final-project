import unittest
import index

class TestIndex(unittest.TestCase):
    def test_first_char(self) -> None:
        self.assertEqual("H", index.get_hello()[0])

    def test_second_char(self) -> None:
        self.assertEqual("e", index.get_hello()[1])

    def test_third_char(self) -> None:
        self.assertEqual("l", index.get_hello()[2])

    def test_fourth_char(self) -> None:
        self.assertEqual("l", index.get_hello()[3])

    def test_fifth_char(self) -> None:
        self.assertEqual("o", index.get_hello()[4])

#if __name__ == '__main__':
#    unittest.main()
