import unittest
import adan

class TestAdan(unittest.TestCase):
    words = adan.get_message().split()
    print(words)
    def test_first_word(self) -> None:
        self.assertEqual("Hello", self.words[0])

    def test_second_word(self) -> None:
        self.assertEqual("from", self.words[1])

    def test_third_word(self) -> None:
        self.assertEqual("Adan's", self.words[2])

    def test_fourth_word(self) -> None:
        self.assertEqual("App", self.words[3])

    def test_fifth_word(self) -> None:
        self.assertEqual("using", self.words[4])

    def test_sixth_word(self) -> None:
        self.assertEqual("Jenkins,", self.words[5])

    def test_seventh_word(self) -> None:
        self.assertEqual("Kubernetes,", self.words[6])

    def test_eighth_word(self) -> None:
        self.assertEqual("and", self.words[7])

    def test_ninth_word(self) -> None:
        self.assertEqual("Terraform!", self.words[8])
#if __name__ == '__main__':
#    unittest.main()
