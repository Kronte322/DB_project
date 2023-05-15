import os

import pytest

from . import read_sql, execute_sql_to_df, sqlalchemy_conn


@pytest.fixture()
def select_scripts():
    path = os.getenv("SCRIPTS_FOLDER_PATH")
    file_names = [file for file in os.listdir(path) if os.path.isfile(os.path.join(path, file))]
    sql_scripts = {}
    for file_name in file_names:
        sql_scripts[file_name] = read_sql(path + '/' + file_name, True)
    return sql_scripts


@pytest.fixture()
def selects_df(select_scripts):
    results = {}
    for file_name in select_scripts:
        results[file_name] = execute_sql_to_df(
            conn=sqlalchemy_conn(),
            sql=select_scripts[file_name]
        )
    return results


def script_1(output):
    if not output.empty:
        assert 5 <= output['num_of_achivments'].min()


def script_2(output):
    if not output.empty:
        is_sorted = all(
            a >= b for a, b in zip(list(output['num_of_achivments']), list(output['num_of_achivments'])[1:]))
        assert is_sorted is True


def script_3(output):
    output = output.dropna()
    if not output.empty:
        is_sorted = all(
            a <= b for a, b in zip(list(output['world_placement']), list(output['world_placement'])[1:]))
        assert is_sorted is True


def script_4(output):
    output = output.dropna()
    if not output.empty:
        is_sorted = all(
            a <= b for a, b in zip(list(output['avg_placement']), list(output['avg_placement'])[1:]))
        assert is_sorted is True
        is_partitioned = True
        countries = {}
        prev_country = None
        for country in list(output['country_nm']):
            countries[country] = True
            if countries[country] == 1:
                is_partitioned = False
                break
            if prev_country is None:
                prev_country = country
                continue
            if country != prev_country:
                countries[country] = 1
            prev_country = country
        assert is_partitioned is True


def script_5(output):
    output = output.dropna()
    if not output.empty:
        is_sorted = all(
            a >= b for a, b in zip(list(output['rating_points']), list(output['rating_points'])[1:]))
        assert is_sorted is True

        is_sorted = all(
            a <= b for a, b in zip(list(output['placement']), list(output['placement'])[1:]))
        assert is_sorted is True


def script_6(output):
    output = output.dropna()
    if not output.empty:
        is_sorted = all(
            a >= b for a, b in zip(list(output['rating_points']), list(output['rating_points'])[1:]))
        assert is_sorted is True
        assert 10 >= len(list(output['rating_points']))


def test(selects_df):
    tests = {'script_1.sql': script_1, 'script_2.sql': script_2, 'script_3.sql': script_3,
             'script_4.sql': script_4, 'script_5.sql': script_5, 'script_6.sql': script_6}
    for file_name in selects_df:
        tests[file_name](selects_df[file_name])
