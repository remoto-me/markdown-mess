Groups
~~~~~~

About Groups
^^^^^^^^^^^^

Schema
^^^^^^

+------------------------------+-----------------------------------------------------------------+----------------------+-----------+-------------+
| Key                          | Description                                                     | Type                 | Default   | Required    |
+==============================+=================================================================+======================+===========+=============+
| ``endpoints``                | Endpoints included into group                                   | ``object``           | ``{}``    | ``true``    |
+------------------------------+-----------------------------------------------------------------+----------------------+-----------+-------------+
| ``music_on_hold``            | The music on hold parameters                                    | ``object``           | ``{}``    | ``false``   |
+------------------------------+-----------------------------------------------------------------+----------------------+-----------+-------------+
| ``music_on_hold.media_id``   | The ID of a media object that should be used as music on hold   | ``string(0..128)``   |           | ``false``   |
+------------------------------+-----------------------------------------------------------------+----------------------+-----------+-------------+
| ``name``                     | A friendly name for the group                                   | ``string(1..128)``   |           | ``true``    |
+------------------------------+-----------------------------------------------------------------+----------------------+-----------+-------------+

Get groups for a given account
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

    GET /v2/accounts/{ACCOUNT\_ID}/groups

.. code:: shell

    curl -v -X GET \
        -H "X-Auth-Token: {AUTH_TOKEN}" \
        http://{SERVER}:8000/v2/accounts/{ACCOUNT_ID}/groups

.. code:: json

    {
        "data": [
            {
                "id": "18ccfd6cea456cbdd38133e5aa726ec4",
                "name": "Group Name",
                "features": [],
                "endpoints": 2
            }
        ],
        "status": "success"
    }

Create a group for a given account
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

    PUT /v2/accounts/{ACCOUNT\_ID}/groups

.. code:: shell

    curl -v -X PUT \
        -H "X-Auth-Token: {AUTH_TOKEN}" \
        -d '{
                "data": {
                    "music_on_hold": {},
                    "name": "Test group",
                    "endpoints": {
                        "df9274b450ea6795cdb381055c3f9b45": {
                            "type": "user",
                            "weight": 1
                        },
                        "dd03d7442a4bec5c092ea6a0e6d579ef": {
                            "type": "device",
                            "weight": 2
                        }
                    }
                },
                "verb": "PUT"
            }' \
        http://{SERVER}:8000/v2/accounts/{ACCOUNT_ID}/groups

.. code:: json

    {
        "data": {
            "music_on_hold": {},
            "name": "Test group",
            "endpoints": {
                "df9274b450ea6795cdb381055c3f9b45": {
                    "type": "user",
                    "weight": 1
                },
                "dd03d7442a4bec5c092ea6a0e6d579ef": {
                    "type": "device",
                    "weight": 2
                }
            },
            "id": "1743724cd775bf6994380dbc79c1af09"
        },
        "status": "success"
    }

Remove a group
^^^^^^^^^^^^^^

    DELETE /v2/accounts/{ACCOUNT\_ID}/groups/{GROUP\_ID}

.. code:: shell

    curl -v -X DELETE \
        -H "X-Auth-Token: {AUTH_TOKEN}" \
        http://{SERVER}:8000/v2/accounts/{ACCOUNT_ID}/groups/{GROUP_ID}

.. code:: json

    {
        "data": {
            "music_on_hold": {},
            "name": "Test group 2",
            "id": "1743724cd775bf6994380dbc79c1af09",
            "endpoints": {
                "df9274b450ea6795cdb381055c3f9b45": {
                    "type": "user",
                    "weight": 1
                },
                "dd03d7442a4bec5c092ea6a0e6d579ef": {
                    "type": "device",
                    "weight": 2
                }
            }
        },
        "status": "success"
    }

Get a group for a given account
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

    GET /v2/accounts/{ACCOUNT\_ID}/groups/{GROUP\_ID}

.. code:: shell

    curl -v -X GET \
        -H "X-Auth-Token: {AUTH_TOKEN}" \
        http://{SERVER}:8000/v2/accounts/{ACCOUNT_ID}/groups/{GROUP_ID}

.. code:: json

    {
        "data": {
            "music_on_hold": {},
            "name": "Test group",
            "endpoints": {
                "df9274b450ea6795cdb381055c3f9b45": {
                    "type": "user",
                    "weight": 1
                },
                "dd03d7442a4bec5c092ea6a0e6d579ef": {
                    "type": "device",
                    "weight": 2
                }
            },
            "ui_metadata": {
                "ui": "kazoo-ui"
            },
            "id": "1743724cd775bf6994380dbc79c1af09"
        },
        "status": "success"
    }

Update a group for a given account
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

    POST /v2/accounts/{ACCOUNT\_ID}/groups/{GROUP\_ID}

    PATCH /v2/accounts/{ACCOUNT\_ID}/groups/{GROUP\_ID}

.. code:: shell

    curl -v -X POST \
        -H "X-Auth-Token: {AUTH_TOKEN}" \
        -d '{
            "data": {
                "music_on_hold": {},
                "name": "Test group 2",
                "id": "1743724cd775bf6994380dbc79c1af09",
                "endpoints": {
                    "df9274b450ea6795cdb381055c3f9b45": {
                        "type": "user",
                        "weight": 1
                    },
                    "dd03d7442a4bec5c092ea6a0e6d579ef": {
                        "type": "device",
                        "weight": 2
                    }
                }
            },
            "verb": "POST"
        }' \
        http://{SERVER}:8000/v2/accounts/{ACCOUNT_ID}/groups/{GROUP_ID}

.. code:: json

    {
        "data": {
            "music_on_hold": {},
            "name": "Test group 2",
            "endpoints": {
                "df9274b450ea6795cdb381055c3f9b45": {
                    "type": "user",
                    "weight": 1
                },
                "dd03d7442a4bec5c092ea6a0e6d579ef": {
                    "type": "device",
                    "weight": 2
                }
            },
            "ui_metadata": {
                "ui": "kazoo-ui"
            },
            "id": "1743724cd775bf6994380dbc79c1af09"
        },
        "status": "success"
    }
