#!/usr/bin/python3
import unittest
import subprocess

class terraformtest(unittest.TestCase):
    def test_terraform_plan(self):
        result = subprocess.run(["terraform", "init", "-backend=false"], cwd="../")
        self.assertEqual(result.returncode, 0)

        result = subprocess.run(["terraform", "fmt", "-check"], cwd="../")
        self.assertEqual(result.returncode, 0)

        result = subprocess.run(["terraform", "validate"], cwd="../")
        self.assertEqual(result.returncode, 0)

        result = subprocess.run(["terraform", "plan"], cwd="../")
        self.assertEqual(result.returncode, 0)


if __name__ == '__main__':
    unittest.main()
