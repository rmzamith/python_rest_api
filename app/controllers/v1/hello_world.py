# -*- coding: utf-8 -*-
"""
Hello World controller
"""

from http import HTTPStatus

from connexion.exceptions import ProblemException
from flask import Response, jsonify

def static_message() -> Response:
    """
    GET /api/v1/hello_world
    """

    dict_result = {}
    dict_result['message'] = "Hello World!"

    return jsonify(dict_result), HTTPStatus.OK

def responsive_message(body: object) -> Response:
    """
    POST /api/v1/hello_world
    """

    message = "Hello World! - " + body.get('input_message') 

    dict_result = {}
    dict_result['message'] = message

    return jsonify(dict_result), HTTPStatus.OK