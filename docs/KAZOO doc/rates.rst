Rates
~~~~~

About Rates
^^^^^^^^^^^

Schema
^^^^^^

+------+--------------+-------+----------+-----------+
| Key  | Description  | Type  | Default  | Required  |
+======+==============+=======+==========+===========+
| ``ca | Friendly     | ``str |          | ``false`` |
| rrie | name for the | ing`` |          |           |
| r``  | carrier      |       |          |           |
|      | providing    |       |          |           |
|      | this rate    |       |          |           |
+------+--------------+-------+----------+-----------+
| ``de | Friendly     | ``str |          | ``false`` |
| scri | description  | ing`` |          |           |
| ptio | of the rate  |       |          |           |
| n``  |              |       |          |           |
+------+--------------+-------+----------+-----------+
| ``di | Apply this   | ``arr | ``["inbo | ``false`` |
| rect | rate based   | ay(st | und", "o |           |
| ion` | on the       | ring( | utbound" |           |
| `    | direction of | 'inbo | ]``      |           |
|      | the call     | und', |          |           |
|      | (relative to |  'out |          |           |
|      | FreeSWITCH)  | bound |          |           |
|      |              | '))`` |          |           |
+------+--------------+-------+----------+-----------+
| ``di |              | ``str |          | ``false`` |
| rect |              | ing`` |          |           |
| ion. |              |       |          |           |
| []`` |              |       |          |           |
+------+--------------+-------+----------+-----------+
| ``in | The per-min  | ``num |          | ``false`` |
| tern | rate charged | ber`` |          |           |
| al_r | by the       |       |          |           |
| ate_ | upstream     |       |          |           |
| cost | provider     |       |          |           |
| ``   |              |       |          |           |
+------+--------------+-------+----------+-----------+
| ``is | Country code | ``str |          | ``false`` |
| o_co | this rate    | ing`` |          |           |
| untr | applies to   |       |          |           |
| y_co |              |       |          |           |
| de`` |              |       |          |           |
+------+--------------+-------+----------+-----------+
| ``op | List of      | ``arr |          | ``false`` |
| tion | options this | ay(st |          |           |
| s``  | rate is good | ring) |          |           |
|      | for, to be   | ``    |          |           |
|      | matched      |       |          |           |
|      | against a    |       |          |           |
|      | customer's   |       |          |           |
|      | options      |       |          |           |
+------+--------------+-------+----------+-----------+
| ``op |              | ``str |          | ``false`` |
| tion |              | ing`` |          |           |
| s.[] |              |       |          |           |
| ``   |              |       |          |           |
+------+--------------+-------+----------+-----------+
| ``pr | E.164 prefix | ``int |          | ``true``  |
| efix | (ignoring    | eger` |          |           |
| ``   | the +)       | `     |          |           |
+------+--------------+-------+----------+-----------+
| ``ra | The per-min  | ``num |          | ``true``  |
| te_c | rate charged | ber`` |          |           |
| ost` | to the       |       |          |           |
| `    | downstream   |       |          |           |
|      | customer     |       |          |           |
+------+--------------+-------+----------+-----------+
| ``ra | The time     | ``int | ``60``   | ``false`` |
| te_i | slice, in    | eger` |          |           |
| ncre | seconds, to  | `     |          |           |
| ment | bill in.     |       |          |           |
| ``   |              |       |          |           |
+------+--------------+-------+----------+-----------+
| ``ra | The minimum  | ``int | ``60``   | ``false`` |
| te_m | time slice,  | eger` |          |           |
| inim | in seconds   | `     |          |           |
| um`` | to bill a    |       |          |           |
|      | call         |       |          |           |
+------+--------------+-------+----------+-----------+
| ``ra | Friendly     | ``str |          | ``false`` |
| te_n | name of the  | ing`` |          |           |
| ame` | rate         |       |          |           |
| `    |              |       |          |           |
+------+--------------+-------+----------+-----------+
| ``ra | If the call  | ``int | ``0``    | ``false`` |
| te_n | duration is  | eger` |          |           |
| ocha | shorter than | `     |          |           |
| rge_ | this         |       |          |           |
| time | threshold    |       |          |           |
| ``   | (seconds),   |       |          |           |
|      | the call is  |       |          |           |
|      | not billed   |       |          |           |
+------+--------------+-------+----------+-----------+
| ``ra | The upfront  | ``num | ``0``    | ``false`` |
| te_s | cost of      | ber`` |          |           |
| urch | connecting   |       |          |           |
| arge | the call     |       |          |           |
| ``   |              |       |          |           |
+------+--------------+-------+----------+-----------+
| ``ro | List of      | ``arr | ``[]``   | ``false`` |
| utes | regexs that  | ay(st |          |           |
| ``   | match valid  | ring) |          |           |
|      | DIDs for     | ``    |          |           |
|      | this rate    |       |          |           |
+------+--------------+-------+----------+-----------+
| ``ro |              | ``str |          | ``false`` |
| utes |              | ing`` |          |           |
| .[]` |              |       |          |           |
| `    |              |       |          |           |
+------+--------------+-------+----------+-----------+
| ``we | Ordering     | ``int |          | ``false`` |
| ight | against      | eger` |          |           |
| ``   | other rates, | `     |          |           |
|      | 1 being most |       |          |           |
|      | preferred,   |       |          |           |
|      | 100 being    |       |          |           |
|      | least        |       |          |           |
|      | preferred    |       |          |           |
+------+--------------+-------+----------+-----------+

Fetch available rates
^^^^^^^^^^^^^^^^^^^^^

    GET /v2/rates

.. code:: shell

    curl -v -X GET \
        -H "X-Auth-Token: {AUTH_TOKEN}" \
        http://{SERVER}:8000/v2/rates

.. code:: json

    {
        "auth_token": "{AUTH_TOKEN}",
        "data": [
            {
                "cost": 0.1,
                "description": "Default US Rate",
                "id":"{RATE_ID}",
                "prefix": "1",
                "surcharge": 0
            }
        ],
        "page_size": 1,
        "request_id": "{REQUEST_ID}",
        "revision": "{REVISION}",
        "status": "success"
    }

Upload a ratedeck CSV
^^^^^^^^^^^^^^^^^^^^^

    POST /v2/rates

For bulk uploading. CSV rows can be formatted in the following ways:

-  ``Prefix, ISO, Desc, Rate``
-  ``Prefix, ISO, Desc, InternalRate, Rate``
-  ``Prefix, ISO, Desc, Surcharge, InternalRate, Rate``
-  ``Prefix, ISO, Desc, InternalSurcharge, Surcharge, InternalRate, Rate``
-  ``Prefix, ISO, Desc, InternalSurcharge, Surcharge, Internal_rate, Rate, Routes, RateIncrement, RateMinimum, Direction``

A US-1 row might look like:

``1, "US-1", "US default rate", 0.01``

This API will return an HTTP 202 and process the CSV in a background process.

.. code:: shell

    curl -v -X POST \
        -H "X-Auth-Token: {AUTH_TOKEN}" \
        -H "Content-Type: text/csv" \
        --data-binary @/path/to/rates.csv \
        http://{SERVER}:8000/v2/rates

.. code:: json

    {
        "auth_token": "{AUTH_TOKEN}",
        "data":""attempting to insert rates from the uploaded document",
        "request_id": "{REQUEST_ID}",
        "revision": "{REVISION}",
        "status": "success"
    }

Create a new rate
^^^^^^^^^^^^^^^^^

    PUT /v2/rates

The ``routes`` key will be populated for you, using the ``prefix``, unless you specify the ``routes`` list here.

.. code:: shell

    curl -v -X PUT \
        -H "X-Auth-Token: {AUTH_TOKEN}" \
        -d '{"data":{
            "prefix":"1",
            "iso_country_code": "US",
            "description": "Default US Rate",
            "rate_cost": 0.1
            }}' \
        http://{SERVER}:8000/v2/rates

.. code:: json

    {
        "auth_token": "{AUTH_TOKEN}",
        "data": {
            "description": "Default US Rate",
            "id": "561d9c4c75950235d5565d138752452c",
            "iso_country_code": "US",
            "prefix": "1",
            "rate_cost": 0.1,
            "rate_increment": 60,
            "rate_minimum": 60,
            "rate_nocharge_time": 0,
            "rate_surcharge": 0,
            "routes": [
                "^\\+?1.+$"
            ]
        },
        "request_id": "{REQUEST_ID}",
        "revision": "{REVISION}",
        "status": "success"
    }

Remove a rate
^^^^^^^^^^^^^

    DELETE /v2/rates/{RATE\_ID}

.. code:: shell

    curl -v -X DELETE \
        -H "X-Auth-Token: {AUTH_TOKEN}" \
        http://{SERVER}:8000/v2/rates/{RATE_ID}

.. code:: json

    {
        "auth_token":"{AUTH_TOKEN}",
        "data": {
            "description": "Default US Rate",
            "id": "{RATE_ID}",
            "iso_country_code": "US",
            "prefix": "1",
            "rate_cost": 0.1,
            "rate_increment": 60,
            "rate_minimum": 60,
            "rate_nocharge_time": 0,
            "rate_surcharge": 0
        },
        "request_id":"{REQUEST_ID}",
        "revision":"{REVISION}",
        "status":"success"
    }

Fetch a rate
^^^^^^^^^^^^

    GET /v2/rates/{RATE\_ID}

.. code:: shell

    curl -v -X GET \
        -H "X-Auth-Token: {AUTH_TOKEN}" \
        http://{SERVER}:8000/v2/rates/{RATE_ID}

.. code:: json

    {
        "auth_token": "{AUTH_TOKEN}",
        "data": {
            "description": "Default US Rate",
            "id": "{RATE_ID}",
            "iso_country_code": "US",
            "prefix": "1",
            "rate_cost": 0.1,
            "rate_increment": 60,
            "rate_minimum": 60,
            "rate_nocharge_time": 0,
            "rate_surcharge": 0,
            "routes": [
                "^\\+?1.+$"
            ]
        },
        "request_id": "{REQUEST_ID}",
        "revision": "{REVISION}",
        "status": "success"
    }

Patch a rate's properties
^^^^^^^^^^^^^^^^^^^^^^^^^

    PATCH /v2/rates/{RATE\_ID}

.. code:: shell

    curl -v -X PATCH \
        -H "X-Auth-Token: {AUTH_TOKEN}" \
        -d '{"data": {"description": "Default North America Rate"}}' \
        http://{SERVER}:8000/v2/rates/{RATE_ID}

.. code:: json

    {
        "auth_token": "{AUTH_TOKEN}",
        "data": {
            "description": "Default North America Rate",
            "id": "{RATE_ID}",
            "iso_country_code": "US",
            "prefix": "1",
            "rate_cost": 0.1,
            "rate_increment": 60,
            "rate_minimum": 60,
            "rate_nocharge_time": 0,
            "rate_surcharge": 0,
            "routes": [
                "^\\+?1.+$"
            ]
        },
        "request_id": "{REQUEST_ID}",
        "revision": "{REVISION}",
        "status": "success"
    }

Change a rate doc
^^^^^^^^^^^^^^^^^

    POST /v2/rates/{RATE\_ID}

.. code:: shell

    curl -v -X POST \
        -H "X-Auth-Token: {AUTH_TOKEN}" \
        -d '{"data":{
            "description": "Default North America Rate",
            "iso_country_code": "US",
            "prefix": "1",
            "rate_cost": 0.1,
            "rate_increment": 60,
            "rate_minimum": 60,
            "rate_nocharge_time": 0,
            "rate_surcharge": 0,
            "routes": ["^\\+?1.+$"]
            }}'
        http://{SERVER}:8000/v2/rates/{RATE_ID}

.. code:: json

    {
        "auth_token": "{AUTH_TOKEN}",
        "data": {
            "description": "Default North America Rate",
            "id": "{RATE_ID}",
            "iso_country_code": "US",
            "prefix": "1",
            "rate_cost": 0.1,
            "rate_increment": 60,
            "rate_minimum": 60,
            "rate_nocharge_time": 0,
            "rate_surcharge": 0,
            "routes": [
                "^\\+?1.+$"
            ]
        },
        "request_id": "{REQUEST_ID}",
        "revision": "{REVISION}",
        "status": "success"
    }

Rate a phone number
^^^^^^^^^^^^^^^^^^^

This API requires that the backend app ``hotornot`` is running.

    GET /v2/rates/number/{PHONE\_NUMBER}

The ``{PHONE_NUMBER}`` must be reconcilable (see your ``reconcile_regex`` for that criteria).

.. code:: shell

    curl -v -X GET \
        -H "X-Auth-Token: {AUTH_TOKEN}" \
        http://{SERVER}:8000/v2/rates/number/{PHONE_NUMBER}

Success
'''''''

.. code:: json

    {
        "auth_token": "{AUTH_TOKEN}",
        "data": {
            "Base-Cost": 0.1,
            "E164-Number": "+{PHONE_NUMBER}",
            "Prefix": "1",
            "Rate": 0.1,
            "Rate-Description": "Default US Rate",
            "Rate-Increment": "60",
            "Rate-Minimum": "60",
            "Surcharge": 0.0
        },
        "request_id": "{REQUEST_ID}",
        "revision": "{REVISION}",
        "status": "success"
    }

Error: unrateable phone number
''''''''''''''''''''''''''''''

.. code:: json

    {
        "auth_token": "{AUTH_TOKEN}",
        "data": {
            "message": "No rate found for this number"
        },
        "error": "500",
        "message": "No rate found for this number",
        "request_id": "{REQUEST_ID}",
        "status": "error"
    }
