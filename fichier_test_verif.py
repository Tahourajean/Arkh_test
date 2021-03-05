# content of test_sample.py

from verif import verif


def test_OK():
    assert True == vif("(())")


def test_KO():
    assert verif("{}{]") == False


def test_KO_fin():
    assert verif("}}}}}}}]]]]]") == False
