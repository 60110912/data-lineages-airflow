import logging
import yaml

import pendulum
import requests
from airflow import AirflowException
# from airflow.utils.db import provide_session
# from airflow.utils.state import State


def read_yaml(path: str) -> dict:
    """
    Reads yaml file
    """
    with open(path, "r") as stream:
        try:
            return yaml.safe_load(stream)
        except yaml.YAMLError as exc:
            print(exc)
            exit(1)


def list_unique_merge(a: list, b: list) -> list:
    """Функция объединяет элементы листов (массивов) и оставляет только уникальные.
        Агрументы:
            a - лист элементов
            b - лист элементов
    """
    a.extend(b)
    return list(set(a))


def log_metrics(attributes: dict,
                metric_name: str,
                metric_value: str):
    logging.info('Got  metric "{}" with attributes "{}" at {}. Value: "{}"'.format(metric_name, attributes,
                                                                                   pendulum.now().in_timezone(
                                                                                       "Europe/Moscow"), metric_value))


def on_dag_complete(attributes: dict, status_code, state: str, context):
    log_metrics(attributes, "airflow_dag_state", status_code, context)


def get_meta(base_url: str, api_endpoint: str, resource: str):
    """
    Get metadata from the service
    :param base_url: Base URL
    :param resource: Resource
    """
    response = requests.get(f"{base_url}{api_endpoint}{resource}")
    if response.ok:
        return response.json()
    else:
        raise AirflowException("Unable to get the metadata from the service")
