Access\_lists
~~~~~~~~~~~~~

SBC-level per-account and per-device access lists allow setting
individual IP-based access filtering rules which significantly increases
security for users working on-premise.

Rules can be applied at account level or at individual device level

About Access\_lists
^^^^^^^^^^^^^^^^^^^

``access_lists`` API works at the level of both ``accounts`` and
``devices`` documents.

Sections:

-  ``access_lists``: root element

   -  ``order`` - order of rules: can be ``"allow,deny"`` or
      ``"deny,allow"``, just like in Apache configuration file
   -  ``cidrs`` - array containing IPv4 subnet addresses in CIDR
      notation that should be allowed or denied (CIDR array looks much
      like one in ecallmgr configuration document)
   -  ``user_agent`` - regex for ``user_agent`` field specified in SIP
      packet. Useful for protecting hardware phone accounts from various
      brute-force attacks

Schema
^^^^^^

+------+--------------+-------+----------+-----------+
| Key  | Description  | Type  | Default  | Required  |
+======+==============+=======+==========+===========+
| ``ci | Classless    | ``arr |          | ``true``  |
| drs` | Inter-Domain | ay(st |          |           |
| `    | Routing IP   | ring) |          |           |
|      | notation for | ``    |          |           |
|      | use on the   |       |          |           |
|      | access lists |       |          |           |
+------+--------------+-------+----------+-----------+
| ``ci |              | ``str |          | ``true``  |
| drs. |              | ing`` |          |           |
| []`` |              |       |          |           |
+------+--------------+-------+----------+-----------+
| ``or | Allow-Deny   | ``str |          | ``true``  |
| der` | or           | ing(' |          |           |
| `    | Deny-Allow?  | allow |          |           |
|      |              | ,deny |          |           |
|      |              | ', 'd |          |           |
|      |              | eny,a |          |           |
|      |              | llow' |          |           |
|      |              | )``   |          |           |
+------+--------------+-------+----------+-----------+
| ``us | RegExp to    | ``str |          | ``false`` |
| er_a | match valid  | ing`` |          |           |
| gent | user agent   |       |          |           |
| ``   | strings      |       |          |           |
+------+--------------+-------+----------+-----------+

Remove account-level access lists
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

    DELETE /v2/accounts/{ACCOUNT\_ID}/access\_lists

.. code:: shell

    curl -v -X DELETE \
        -H "X-Auth-Token: {AUTH_TOKEN}" \
        http://{SERVER}:8000/v2/accounts/{ACCOUNT_ID}/access_lists

Fetch account-level access lists
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

    GET /v2/accounts/{ACCOUNT\_ID}/access\_lists

.. code:: shell

    curl -v -X GET \
        -H "X-Auth-Token: {AUTH_TOKEN}" \
        http://{SERVER}:8000/v2/accounts/{ACCOUNT_ID}/access_lists

.. code:: json

    {
        "auth_token": "{AUTH_TOKEN}",
        "data": {},
        "request_id": "{REQUEST_ID}",
        "revision": "{REVISION}",
        "status": "success"
    }

Update account-level access lists
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

    POST /v2/accounts/{ACCOUNT\_ID}/access\_lists

.. code:: shell

    curl -v -X POST \
        -H "X-Auth-Token: {AUTH_TOKEN}" \
        -d '{"data": {"order": "allow,deny","cidrs": ["127.0.0.3/32"]}}' \
        http://{SERVER}:8000/v2/accounts/{ACCOUNT_ID}/access_lists

.. code:: json

    {
        "auth_token": "{AUTH_TOKEN}",
        "data": {
            "cidrs": [
                "127.0.0.3/32"
            ],
            "order": "allow,deny"
        },
        "request_id": "{REQUEST_ID}",
        "revision": "{REVISION}",
        "status": "success"
    }

Remove device-level access lists
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

    DELETE /v2/accounts/{ACCOUNT\_ID}/devices/{DEVICE\_ID}/access\_lists

.. code:: shell

    curl -v -X DELETE \
        -H "X-Auth-Token: {AUTH_TOKEN}" \
        http://{SERVER}:8000/v2/accounts/{ACCOUNT_ID}/devices/{DEVICE_ID}/access_lists

Fetch device-level access lists
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

    GET /v2/accounts/{ACCOUNT\_ID}/access\_lists

.. code:: shell

    curl -v -X GET \
        -H "X-Auth-Token: {AUTH_TOKEN}" \
        http://{SERVER}:8000/v2/accounts/{ACCOUNT_ID}/access_lists

.. code:: json

    {
        "auth_token": "{AUTH_TOKEN}",
        "data": {
            "cidrs": [
                "127.0.0.3/32"
            ],
            "order": "allow,deny"
        },
        "request_id": "{REQUEST_ID}",
        "revision": "{REVISION}",
        "status": "success"
    }

Update device-level access lists
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

    POST /v2/accounts/{ACCOUNT\_ID}/access\_lists

.. code:: shell

    curl -v -X POST \
        -H "X-Auth-Token: {AUTH_TOKEN}" \
        -d '{"data": {"order": "deny,allow","cidrs": ["127.0.0.3/32"]}}' \
        http://{SERVER}:8000/v2/accounts/{ACCOUNT_ID}/access_lists

.. code:: json

    {
        "auth_token": "{AUTH_TOKEN}",
        "data": {
            "cidrs": [
                "127.0.0.3/32"
            ],
            "order": "deny,allow"
        },
        "request_id": "{REQUEST_ID}",
        "revision": "{REVISION}",
        "status": "success"
    }
