Limits
~~~~~~

About Limits
^^^^^^^^^^^^

Schema
^^^^^^

+------+--------------+-------+----------+-----------+
| Key  | Description  | Type  | Default  | Required  |
+======+==============+=======+==========+===========+
| ``al | Determines   | ``boo | ``true`` | ``false`` |
| low_ | if the       | lean` |          |           |
| prep | account      | `     |          |           |
| ay`` | would like   |       |          |           |
|      | to allow     |       |          |           |
|      | per-minute   |       |          |           |
|      | calls if     |       |          |           |
|      | they have    |       |          |           |
|      | credit       |       |          |           |
+------+--------------+-------+----------+-----------+
| ``bu | The number   | ``int |          | ``false`` |
| rst_ | of two-way,  | eger` |          |           |
| trun | flat-rate    | `     |          |           |
| ks`` | trunks used  |       |          |           |
|      | only if no   |       |          |           |
|      | other trunks |       |          |           |
|      | are          |       |          |           |
|      | available    |       |          |           |
+------+--------------+-------+----------+-----------+
| ``ca | A hard limit | ``int |          | ``false`` |
| lls` | for the      | eger` |          |           |
| `    | total number | `     |          |           |
|      | calls        |       |          |           |
+------+--------------+-------+----------+-----------+
| ``in | The number   | ``int |          | ``false`` |
| boun | of inbound,  | eger` |          |           |
| d_tr | flat-rate    | `     |          |           |
| unks | trunks       |       |          |           |
| ``   |              |       |          |           |
+------+--------------+-------+----------+-----------+
| ``ou | The number   | ``int |          | ``false`` |
| tbou | of outbound, | eger` |          |           |
| nd_t | flat-rate    | `     |          |           |
| runk | trunks       |       |          |           |
| s``  |              |       |          |           |
+------+--------------+-------+----------+-----------+
| ``re | A hard limit | ``int |          | ``false`` |
| sour | for the      | eger` |          |           |
| ce_c | number of    | `     |          |           |
| onsu | resource     |       |          |           |
| ming | consuming    |       |          |           |
| _cal | calls        |       |          |           |
| ls`` |              |       |          |           |
+------+--------------+-------+----------+-----------+
| ``tw | The number   | ``int |          | ``false`` |
| oway | of two-way,  | eger` |          |           |
| _tru | flat-rate    | `     |          |           |
| nks` | trunks       |       |          |           |
| `    |              |       |          |           |
+------+--------------+-------+----------+-----------+

Get limits for a given account
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

    GET /v2/accounts/{ACCOUNT\_ID}/limits

.. code:: shell

    curl -v -X GET \
        -H "X-Auth-Token: {AUTH_TOKEN}" \
        http://{SERVER}:8000/v2/accounts/{ACCOUNT_ID}/limits

.. code:: json

    {
        "data": {
            "twoway_trunks": 0,
            "inbound_trunks": 0,
            "id": "limits",
            "allow_prepay": true,
            "outbound_trunks": 5
        },
        "status": "success"
    }

Update limits for a given account
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

    POST /v2/accounts/{ACCOUNT\_ID}/limits

First using API v1 (simplest):

.. code:: shell

    curl -v -X POST \
        -H "X-Auth-Token: {AUTH_TOKEN}" \
        -d '{"data": {
            "twoway_trunks": 0,
            "inbound_trunks": 11,
            "id": "limits",
            "allow_prepay": true,
            "outbound_trunks": 5
        }}' \
        http://{SERVER}:8000/v1/accounts/{ACCOUNT_ID}/limits

.. code:: json

    {
        "data": {
            "twoway_trunks": 0,
            "inbound_trunks": 11,
            "id": "limits",
            "allow_prepay": true,
            "outbound_trunks": 5
        },
        "status": "success",
    }

Now with API v2:

.. code:: shell

    curl -v -X POST \
        -H "X-Auth-Token: {AUTH_TOKEN}" \
        -d '{"data": {
            "twoway_trunks": 0,
            "inbound_trunks": 11,
            "id": "limits",
            "allow_prepay": true,
            "outbound_trunks": 5
        }}' \
        http://{SERVER}:8000/v2/accounts/{ACCOUNT_ID}/limits

Reply warns that charges have to be accepted (402):

::

    {
        "data": {
            "limits": {
                "inbound_trunks": {
                    "category": "limits",
                    "item": "inbound_trunks",
                    "quantity": 11,
                    "rate": 6.9900000000000002132,
                    "single_discount": true,
                    "single_discount_rate": 0.0,
                    "cumulative_discount": 0,
                    "cumulative_discount_rate": 0.0
                }
            }
        },
        "error": "402",
        "message": "accept charges",
        "status": "error",
    }

Re-do the same request, setting ``accept_charges`` to ``true``.

.. code:: shell

    curl -v -X POST \
        -H "X-Auth-Token: {AUTH_TOKEN}" \
        -d '{"data": {
            "twoway_trunks": 0,
            "inbound_trunks": 11,
            "id": "limits",
            "allow_prepay": true,
            "outbound_trunks": 5,
            "accept_charges": trye
        }}' \
        http://{SERVER}:8000/v2/accounts/{ACCOUNT_ID}/limits

.. code:: json

    {
        "data": {
            "twoway_trunks": 0,
            "inbound_trunks": 11,
            "id": "limits",
            "allow_prepay": true,
            "outbound_trunks": 5
        },
        "status": "success",
    }
