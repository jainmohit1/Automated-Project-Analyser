import nbimporter
import pylintApi as api
import unittest

class TestNotebook(unittest.TestCase):

    def test_file_list(self):
        URL = "https://api.github.com/repos/ayushjain10/MockRepo"
        ans_list = ['factorial.py', 'isprime.py']
        return_list = api.getFileNames(URL)
        self.assertEqual(ans_list, return_list)

    def test_url_validity(self):
        URL = "https://api.github.com/repos/ayushjain10/MockRepo"
        ans = True
        return_ans = api.checkValidUrl(URL)
        self.assertEqual(ans, return_ans)

    def test_warn_count(self):
        file = "file.txt"
        ans = 13
        return_count = api.getWarningCount(file)
        self.assertEqual(ans, return_count)

    def test_error_count(self):
        file = "file.txt"
        ans = 0
        return_count = api.getErrorCount(file)
        self.assertEqual(ans, return_count)


    def test_conv_count(self):
        file = "file.txt"
        ans = 18
        return_count = api.getConventionCount(file)
        self.assertEqual(ans, return_count)


    def test_refactor_count(self):
        file = "file.txt"
        ans = 0
        return_count = api.getRefactorCount(file)
        self.assertEqual(ans, return_count)

    def test_conv_dict(self):
        file = "file.txt"
        ans_dict = {' C0326': 12, ' C0111': 2, ' C0103': 3, ' C0303': 1}
        return_dict = api.getConventionDict(file)
        self.assertEqual(ans_dict, return_dict)

    def test_refactor_dict(self):
        file = "file.txt"
        ans_dict = {}
        return_dict = api.getRefactorDict(file)
        self.assertEqual(ans_dict, return_dict)

    def test_error_dict(self):
        file = "file.txt"
        ans_dict = {}
        return_dict = api.getErrorDict(file)
        self.assertEqual(ans_dict, return_dict)

    def test_warn_dict(self):
        file = "file.txt"
        ans_dict = {' W0311': 13}
        return_dict = api.getWarningDict(file)
        self.assertEqual(ans_dict, return_dict)

unittest.main(argv=[''], verbosity=2, exit=False)

