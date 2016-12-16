Call Statistics
===============

This is an endpoint which attempts to provide a more useful way of getting data from CDRs.

How to configure
----------------

This module should be to point to the call\_statistics API in the ``call_statistics`` document in the ``system_config`` database. system\_config/call\_statistics "default": { "version": "v1" }, system\_config/crossbar.call\_statistics "default": { "url": "localhost:5000/api" }

Get a list of countries
-----------------------

Get a list of countries which can be used to get regions to use in queries.

Request
~~~~~~~

``GET`` request to ``/v2/accounts/{ACCOUNT_ID}/call_statistics/countries``

Response
~~~~~~~~

::

    {
        "data": {
            "countries": [
                "Ghana",
                "Germany",
                "Georgia",
                "Gambia",
                ...
            ]
        }
    }

Get a list of regions for a set of countries
--------------------------------------------

Get a list of region ids which can be used in queries.

Request
~~~~~~~

``GET`` request to ``/v2/accounts/{ACCOUNT_ID}/call_statistics/countries/{COUNTRY_LIST}`` where ``COUNTRY_LIST`` is a list of '&' separated names of countries you wish to get regions for. For every region there is a list of ids to be used in queries requiring locations.

For example ``/v2/accounts/{ACCOUNT_ID}/call_statistics/countries/New%20Zealand&Australia``

Response
~~~~~~~~

::

    {
        "data": {
            "countries": {
                "New Zealand": {
                    "New Zealand Balclutha": [
                        5023,
                        5024,
                    ],
                    "New Zealand Riverton": [
                        4723,
                        4724,
                        4725,
                    ]
                },
                "Australia": {
                    "Australia Melbourne": [
                        7721,
                        7722
                    ],
                    "Australia Mobile": [
                        350604,
                        350554,
                    ]
                }
            }
        }
    }

Making a statistics query
-------------------------

Get call statistics for time intervals matching a query.

Note: if a period or group is empty then it will not be in the response JSON.

Request
~~~~~~~

``GET`` request to ``/v2/accounts/{ACCOUNT_ID}/call_statistics/{TIME_PERIOD}?q={JSON_BODY}`` Where ``JSON_BODY`` is percent encoded JSON. This is annoying, but there isn't really a better way to do this.

``TIME_PERIOD`` is the period that results will be grouped by. Valid periods are: \* monthly \* weekly \* daily \* hourly

Body
^^^^

::

    {
        "data": {
            "filters": {FILTER_LIST},
            "grouping": {GROUPING},
            "timezone": {TIMEZONE}
        }
    }

``FILTER_LIST`` is a list of filters to apply to the query. See Filters for more info. ``GROUPING`` is an optional way of further grouping your results. If a grouping is specified then results will be grouped by that field, within the time period grouping. Any fields in the fields section of the
Filter section marked as groupable can be used. ``TIMEZONE`` is an optional TZ format timezone, eg. "Pacific/Auckland". This is used for both the request and response times.

For example
``/v2/accounts/{ACCOUNT_ID}/call_statistics/hourly?q={%22filters%22:[{%22name%22:%22call_time%22,%22op%22:%22gte%22,%22val%22:%2200:00:00%2004/03/2016%22},{%22name%22:%22call_time%22,%22op%22:%22lte%22,%22val%22:%2223:00:00%2004/03/2016%22},{%22name%22:%22call_direction%22,%22op%22:%22in%22,%22val%22:[%22inbound%22,%22outbound%22]}],%22grouping%22:%22unanswered%22,%22timezone%22:%22Pacific/Auckland%22}``

::

    {
        "data": {
            "08:00:00 04/03/2016": {
                "total": 6,
                "groups": {
                    "0": {
                        "total": 6,
                        "duration_seconds": {
                            "max": 79,
                            "min": 5,
                            "median": 6.5,
                            "mean": 19.0
                        }
                    }
                },
                "duration_seconds": {
                    "max": 79,
                    "min": 5,
                    "median": 6.5,
                    "mean": 19.0
                }
            }
            "08:00:00 04/03/2016": {
                "total": 3,
                "groups": {
                    "0": {
                        "total": 2,
                        "duration_seconds": {
                            "max": 79,
                            "min": 5,
                            "median": 6.5,
                            "mean": 19.0
                        }
                    },
                    "1": {
                        "total": 1,
                        "duration_seconds": {
                            "max": 3,
                            "min": 2,
                            "median": 2.5,
                            "mean": 2.5
                        }
                    }
                },
                "duration_seconds": {
                    "max": 79,
                    "min": 5,
                    "median": 6.5,
                    "mean": 19.0
                }
            }
        }
    }

Making a CSV query
------------------

Get a CSV file containing call records matching a query.

Request
~~~~~~~

``GET`` request to ``/v2/accounts/{ACCOUNT_ID}/call_statistics/csv?q={JSON_BODY}`` Where ``JSON_BODY`` is percent encoded JSON. This is annoying, but there isn't really a better way to do this.

Body
^^^^

::

    {
        "data": {
            "filters": {FILTER_LIST}
            "timezone": {TIMEZONE}
        }
    }

``FILTER_LIST`` is a list of filters to apply to the query. See Filters for more info. ``TIMEZONE`` is an optional TZ format timezone, eg. "Pacific/Auckland". This is used for both the request and response times.

Filters
=======

A filter list is provided with the statistics and CSV queries. Filters allow you to filter data like you would in a SQL WHERE clause.

Format
------

The format is the same as documented in the Filters section `here <https://flask-restless.readthedocs.org/en/stable/searchformat.html#query-format>`__

Fields
------

The following fields can be used in filters:

-  ``call_time``
-  ``call_direction`` - groupable
-  ``caller_zone_id``
-  ``callee_zone_id``
-  ``caller_id_name``
-  ``unanswered`` - groupable
