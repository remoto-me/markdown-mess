Accounts
~~~~~~~~

About Accounts
^^^^^^^^^^^^^^

Accounts are the container for most things in Kazoo. They typically represent an office, business, family, etc. Kazoo arranges accounts into a tree structure, where parent accounts can access their sub accounts but not their ancestor accounts.

About the Account Tree
^^^^^^^^^^^^^^^^^^^^^^

Since accounts can be the child of 0 or more parent accounts, it is necessary to track each account's lineage. This is tracked in the account document (\_id = ID of the account) in the ``pvt_tree`` array. The order of the list is from most-ancestral to parent.

So given ``"pvt_tree":["1", "2", "3"]``, it can be determined that "3" is the parent account, "2" the grand-parent, and "1" is the great-grandparent. ``"pvt_tree":[]`` indicates the master (or Highlander) account; there should only be one!

Schema
^^^^^^

+------+--------------+-------+----------+-----------+
| Key  | Description  | Type  | Default  | Required  |
+======+==============+=======+==========+===========+
| ``ca | Account      | ``obj | ``{}``   | ``false`` |
| ll_r | level call   | ect`` |          |           |
| estr | restrictions |       |          |           |
| icti | for each     |       |          |           |
| on`` | available    |       |          |           |
|      | number       |       |          |           |
|      | classificati |       |          |           |
|      | on           |       |          |           |
+------+--------------+-------+----------+-----------+
| ``ca |              | ``#/d |          | ``false`` |
| ll_w |              | efini |          |           |
| aiti |              | tions |          |           |
| ng`` |              | /call |          |           |
|      |              | _wait |          |           |
|      |              | ing`` |          |           |
+------+--------------+-------+----------+-----------+
| ``ca | The account  | ``obj | ``{}``   | ``false`` |
| ller | default      | ect`` |          |           |
| _id` | caller ID    |       |          |           |
| `    | parameters   |       |          |           |
+------+--------------+-------+----------+-----------+
| ``di | A list of    | ``obj | ``{}``   | ``false`` |
| al_p | default      | ect`` |          |           |
| lan` | rules used   |       |          |           |
| `    | to modify    |       |          |           |
|      | dialed       |       |          |           |
|      | numbers      |       |          |           |
+------+--------------+-------+----------+-----------+
| ``do |              | ``obj |          | ``false`` |
| _not |              | ect`` |          |           |
| _dis |              |       |          |           |
| turb |              |       |          |           |
| ``   |              |       |          |           |
+------+--------------+-------+----------+-----------+
| ``do | The default  | ``boo |          | ``false`` |
| _not | value for    | lean` |          |           |
| _dis | do-not-distu | `     |          |           |
| turb | rb           |       |          |           |
| .ena |              |       |          |           |
| bled |              |       |          |           |
| ``   |              |       |          |           |
+------+--------------+-------+----------+-----------+
| ``en | Determines   | ``boo | ``true`` | ``false`` |
| able | if the       | lean` |          |           |
| d``  | account is   | `     |          |           |
|      | currently    |       |          |           |
|      | enabled      |       |          |           |
+------+--------------+-------+----------+-----------+
| ``la | The language | ``str | ``en-us` | ``false`` |
| ngua | for this     | ing`` | `        |           |
| ge`` | account      |       |          |           |
+------+--------------+-------+----------+-----------+
| ``me |              | ``#/d |          | ``false`` |
| tafl |              | efini |          |           |
| ows` |              | tions |          |           |
| `    |              | /meta |          |           |
|      |              | flows |          |           |
|      |              | ``    |          |           |
+------+--------------+-------+----------+-----------+
| ``mu | The default  | ``obj | ``{}``   | ``false`` |
| sic_ | music on     | ect`` |          |           |
| on_h | hold         |       |          |           |
| old` | parameters   |       |          |           |
| `    |              |       |          |           |
+------+--------------+-------+----------+-----------+
| ``mu | The ID of a  | ``str |          | ``false`` |
| sic_ | media object | ing(0 |          |           |
| on_h | that should  | ..128 |          |           |
| old. | be used as   | )``   |          |           |
| medi | the default  |       |          |           |
| a_id | music on     |       |          |           |
| ``   | hold         |       |          |           |
+------+--------------+-------+----------+-----------+
| ``na | A friendly   | ``str |          | ``true``  |
| me`` | name for the | ing(1 |          |           |
|      | account      | ..128 |          |           |
|      |              | )``   |          |           |
+------+--------------+-------+----------+-----------+
| ``or | Full legal   | ``str |          | ``false`` |
| g``  | name of the  | ing`` |          |           |
|      | organization |       |          |           |
+------+--------------+-------+----------+-----------+
| ``pr | Each         | ``obj | ``{}``   | ``false`` |
| eflo | property     | ect`` |          |           |
| w``  | provides     |       |          |           |
|      | functionalit |       |          |           |
|      | y            |       |          |           |
|      | that can be  |       |          |           |
|      | applied to   |       |          |           |
|      | calls using  |       |          |           |
|      | the callflow |       |          |           |
|      | application  |       |          |           |
+------+--------------+-------+----------+-----------+
| ``pr | The ID of a  | ``str |          | ``false`` |
| eflo | callflow to  | ing`` |          |           |
| w.al | always       |       |          |           |
| ways | execute      |       |          |           |
| ``   | prior to     |       |          |           |
|      | processing   |       |          |           |
|      | the callflow |       |          |           |
|      | with         |       |          |           |
|      | numbers/patt |       |          |           |
|      | erns         |       |          |           |
|      | matching the |       |          |           |
|      | request      |       |          |           |
+------+--------------+-------+----------+-----------+
| ``re | The realm of | ``str |          | ``false`` |
| alm` | the account, | ing(4 |          |           |
| `    | ie:          | ..253 |          |           |
|      | 'account1.26 | )``   |          |           |
|      | 00hz.com'    |       |          |           |
+------+--------------+-------+----------+-----------+
| ``ri |              | ``obj | ``{}``   | ``false`` |
| ngto |              | ect`` |          |           |
| nes` |              |       |          |           |
| `    |              |       |          |           |
+------+--------------+-------+----------+-----------+
| ``ri | The alert    | ``str |          | ``false`` |
| ngto | info SIP     | ing(0 |          |           |
| nes. | header added | ..256 |          |           |
| exte | when the     | )``   |          |           |
| rnal | call is from |       |          |           |
| ``   | internal     |       |          |           |
|      | sources      |       |          |           |
+------+--------------+-------+----------+-----------+
| ``ri | The alert    | ``str |          | ``false`` |
| ngto | info SIP     | ing(0 |          |           |
| nes. | header added | ..256 |          |           |
| inte | when the     | )``   |          |           |
| rnal | call is from |       |          |           |
| ``   | external     |       |          |           |
|      | sources      |       |          |           |
+------+--------------+-------+----------+-----------+
| ``ti | The default  | ``str | ``Americ | ``false`` |
| mezo | timezone     | ing(5 | a/Los_An |           |
| ne`` |              | ..32) | geles``  |           |
|      |              | ``    |          |           |
+------+--------------+-------+----------+-----------+
| ``vo |              | ``obj |          | ``false`` |
| icem |              | ect`` |          |           |
| ail` |              |       |          |           |
| `    |              |       |          |           |
+------+--------------+-------+----------+-----------+
| ``vo |              | ``obj |          | ``false`` |
| icem |              | ect`` |          |           |
| ail. |              |       |          |           |
| noti |              |       |          |           |
| fy`` |              |       |          |           |
+------+--------------+-------+----------+-----------+
| ``vo |              | ``#/d |          | ``false`` |
| icem |              | efini |          |           |
| ail. |              | tions |          |           |
| noti |              | /noti |          |           |
| fy.c |              | fy.ca |          |           |
| allb |              | llbac |          |           |
| ack` |              | k``   |          |           |
| `    |              |       |          |           |
+------+--------------+-------+----------+-----------+

Create a new child account
^^^^^^^^^^^^^^^^^^^^^^^^^^

Puts the created account under the account of the owner of the ``{AUTH_TOKEN}``. This is a shortcut for ``PUT /v2/accounts/{AUTH_ACCOUNT_ID}``

    PUT /v2/accounts

.. code:: shell

    curl -v -X PUT \
        -H "X-Auth-Token: {AUTH_TOKEN}" \
        -H "Content-Type: application/json" \
        -d '{"data":{"name":"child account"}}' \
        http://{SERVER}:8000/v2/accounts

.. code:: json

    {
        "auth_token": "{AUTH_TOKEN}",
        "data": {
            "billing_mode": "manual",
            "call_restriction": {},
            "caller_id": {},
            "created": 63621662701,
            "dial_plan": {},
            "enabled": true,
            "id": "{ACCOUNT_ID}",
            "is_reseller": false,
            "language": "en-us",
            "music_on_hold": {},
            "name": "child account",
            "preflow": {},
            "realm": "aeac33.sip.2600hz.com",
            "reseller_id": "undefined",
            "ringtones": {},
            "superduper_admin": false,
            "timezone": "America/Los_Angeles",
            "wnm_allow_additions": false
        },
        "request_id": "{REQUEST_ID}",
        "revision": "{REVISION}",
        "status": "success"
    }

Remove an account
^^^^^^^^^^^^^^^^^

    DELETE /v2/accounts/{ACCOUNT\_ID}

.. code:: shell

    curl -v -X DELETE \
        -H "X-Auth-Token: {AUTH_TOKEN}" \
        http://{SERVER}:8000/v2/accounts/{ACCOUNT_ID}

.. code:: json

    {
        "auth_token": "{AUTH_TOKEN}",
        "data": {
            "billing_mode": "manual",
            "call_restriction": {},
            "caller_id": {},
            "created": 63621662701,
            "dial_plan": {},
            "enabled": true,
            "id": "{ACCOUNT_ID}",
            "is_reseller": false,
            "language": "en-us",
            "music_on_hold": {},
            "name": "child account",
            "preflow": {},
            "realm": "aeac33.sip.2600hz.com",
            "reseller_id": "undefined",
            "ringtones": {},
            "superduper_admin": false,
            "timezone": "America/Los_Angeles",
            "wnm_allow_additions": false
        },
        "request_id": "{REQUEST_ID}",
        "revision": "{REVISION}",
        "status": "success"
    }

Fetch the account doc
^^^^^^^^^^^^^^^^^^^^^

    GET /v2/accounts/{ACCOUNT\_ID}

.. code:: shell

    curl -v -X GET \
        -H "X-Auth-Token: {AUTH_TOKEN}" \
        http://{SERVER}:8000/v2/accounts/{ACCOUNT_ID}

.. code:: json

    {
        "auth_token": "{AUTH_TOKEN}",
        "data": {
            "billing_mode": "manual",
            "call_restriction": {},
            "caller_id": {},
            "created": 63621662701,
            "dial_plan": {},
            "enabled": true,
            "id": "{ACCOUNT_ID}",
            "is_reseller": false,
            "language": "en-us",
            "music_on_hold": {},
            "name": "child account",
            "preflow": {},
            "realm": "aeac33.sip.2600hz.com",
            "reseller_id": "undefined",
            "ringtones": {},
            "superduper_admin": false,
            "timezone": "America/Los_Angeles",
            "wnm_allow_additions": false
        },
        "request_id": "{REQUEST_ID}",
        "revision": "{REVISION}",
        "status": "success"
    }

Patch the account doc
^^^^^^^^^^^^^^^^^^^^^

    PATCH /v2/accounts/{ACCOUNT\_ID}

.. code:: shell

    curl -v -X PATCH \
        -H "X-Auth-Token: {AUTH_TOKEN}" \
        -d '{"data":{"some_key":"some_value"}}' \
        http://{SERVER}:8000/v2/accounts/{ACCOUNT_ID}

.. code:: json

    {
        "auth_token": "{AUTH_TOKEN}",
        "data": {
            "billing_mode": "manual",
            "call_restriction": {},
            "caller_id": {},
            "created": 63621662701,
            "dial_plan": {},
            "enabled": true,
            "id": "{ACCOUNT_ID}",
            "is_reseller": false,
            "language": "en-us",
            "music_on_hold": {},
            "name": "child account",
            "preflow": {},
            "realm": "aeac33.sip.2600hz.com",
            "reseller_id": "undefined",
            "ringtones": {},
            "some_key":"some_value",
            "superduper_admin": false,
            "timezone": "America/Los_Angeles",
            "wnm_allow_additions": false
        },
        "request_id": "{REQUEST_ID}",
        "revision": "{REVISION}",
        "status": "success"
    }

Change the account doc
^^^^^^^^^^^^^^^^^^^^^^

    POST /v2/accounts/{ACCOUNT\_ID}

.. code:: shell

    curl -v -X POST \
        -H "X-Auth-Token: {AUTH_TOKEN}" \
        -H "Content-Type: application/json" \
        -d '{"data": {"billing_mode": "manual","call_restriction": {},"caller_id": {},"created": 63621662701,"dial_plan": {},"enabled": true,"is_reseller": false,"language": "en-us","music_on_hold": {},"name": "child account","preflow": {},"realm": "aeac33.sip.2600hz.com","reseller_id": "undefined","ringtones": {},"some_key":"some_value","superduper_admin": false,"timezone": "America/Los_Angeles","wnm_allow_additions": false}}' \
        http://{SERVER}:8000/v2/accounts/{ACCOUNT_ID}

.. code:: json

    {
        "auth_token": "{AUTH_TOKEN}",
        "data": {
            "billing_mode": "manual",
            "call_restriction": {},
            "caller_id": {},
            "created": 63621662701,
            "dial_plan": {},
            "enabled": true,
            "id": "{ACCOUNT_ID}",
            "is_reseller": false,
            "language": "en-us",
            "music_on_hold": {},
            "name": "child account",
            "preflow": {},
            "realm": "aeac33.sip.2600hz.com",
            "reseller_id": "undefined",
            "ringtones": {},
            "some_key":"some_value",
            "superduper_admin": false,
            "timezone": "America/Los_Angeles",
            "wnm_allow_additions": false
        },
        "request_id": "{REQUEST_ID}",
        "revision": "{REVISION}",
        "status": "success"
    }

Create a new child account
^^^^^^^^^^^^^^^^^^^^^^^^^^

Puts the created account under ``{ACCOUNT_ID}``

    PUT /v2/accounts/{ACCOUNT\_ID}

.. code:: shell

    curl -v -X PUT \
        -H "X-Auth-Token: {AUTH_TOKEN}" \
        -H "Content-Type: application/json" \
        -d '{"data":{"name":"child account"}}' \
        http://{SERVER}:8000/v2/accounts/{ACCOUNT_ID}

.. code:: json

    {
        "auth_token": "{AUTH_TOKEN}",
        "data": {
            "billing_mode": "manual",
            "call_restriction": {},
            "caller_id": {},
            "created": 63621662701,
            "dial_plan": {},
            "enabled": true,
            "id": "{CHILD_ACCOUNT_ID}",
            "is_reseller": false,
            "language": "en-us",
            "music_on_hold": {},
            "name": "child account",
            "preflow": {},
            "realm": "aeac33.sip.2600hz.com",
            "reseller_id": "undefined",
            "ringtones": {},
            "superduper_admin": false,
            "timezone": "America/Los_Angeles",
            "wnm_allow_additions": false
        },
        "request_id": "{REQUEST_ID}",
        "revision": "{REVISION}",
        "status": "success"
    }

Fetch the parent account IDs
^^^^^^^^^^^^^^^^^^^^^^^^^^^^

    GET /v2/accounts/{ACCOUNT\_ID}/parents

.. code:: shell

    curl -v -X GET \
        -H "X-Auth-Token: {AUTH_TOKEN}" \
        http://{SERVER}:8000/v2/accounts/{ACCOUNT_ID}/parents

.. code:: json

    {
        "auth_token": "{AUTH_TOKEN}",
        "data": [
            {
                "id": "{PARENT_ACCOUNT_ID}",
                "name": "{PARENT_ACCOUNT_NAME}"
            }
        ],
        "page_size": 1,
        "request_id": "{REQUEST_ID}",
        "revision": "{REVISION}",
        "status": "success"
    }

Fetch an account's ancestor tree
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

    GET /v2/accounts/{ACCOUNT\_ID}/tree

.. code:: shell

    curl -v -X GET \
        -H "X-Auth-Token: {AUTH_TOKEN}" \
        http://{SERVER}:8000/v2/accounts/{ACCOUNT_ID}/tree

.. code:: json

    {
        "auth_token": "{AUTH_TOKEN}",
        "data": [
            {
                "id": "{PARENT_ACCOUNT_ID}",
                "name": "{PARENT_ACCOUNT_NAME}"
            }
        ],
        "page_size": 1,
        "request_id": "{REQUEST_ID}",
        "revision": "{REVISION}",
        "status": "success"
    }

Fetch the account's API key
^^^^^^^^^^^^^^^^^^^^^^^^^^^

The API key is used by the ``api_auth`` API to obtain an ``auth_token``. This is intended for use by applications talking to kazoo and provides a mechanism for authentication that does not require storing a username and password in the application. The API key can be obtained via the accounts API's endpoint ``api_key``.

    GET /v2/accounts/{ACCOUNT\_ID}/api\_key

.. code:: shell

    curl -v -X GET \
        -H "X-Auth-Token: {AUTH_TOKEN}" \
         http://{SERVER}:8000/v2/accounts/{ACCOUNT_ID}/api_key

.. code:: json

    {
        "auth_token": "{AUTH_TOKEN}",
        "data": {
            "api_key": "{API_KEY}"
        },
        "request_id": "{REQUEST_ID}",
        "revision": "{REVISION}",
        "status": "success"
    }

Fetch sibling accounts
^^^^^^^^^^^^^^^^^^^^^^

By default a user account under an admin/reseller account can view all the other accounts under that reseller. If you would like current account only will be able to query its child accounts' sibling and not other accounts then set ``allow_sibling_listing`` in ``system_config/crossbar.accounts`` to ``false``. Admin account can unrestrictedly list siblings.

    GET /v2/accounts/{ACCOUNT\_ID}/siblings

.. code:: shell

    curl -v -X GET \
        -H "X-Auth-Token: {AUTH_TOKEN}" \
        http://{SERVER}:8000/v2/accounts/{ACCOUNT_ID}/siblings

.. code:: json

    {
        "auth_token": "{AUTH_TOKEN}",
        "data": [
            {
                "descendants_count": 1,
                "id": "{ACCOUNT_ID}",
                "name": "{ACCOUNT_NAME}",
                "realm": "{ACCOUNT_REALM}"
            }
        ],
        "page_size": 1,
        "request_id": "{REQUEST_ID}",
        "revision": "{REVISION}",
        "start_key": "",
        "status": "success"
    }

Fetch all descendants of an account
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

This will include children, grandchildren, etc

    GET /v2/accounts/{ACCOUNT\_ID}/descendants

.. code:: shell

    curl -v -X GET \
        -H "X-Auth-Token: {AUTH_TOKEN}" \
        http://{SERVER}:8000/v2/accounts/{ACCOUNT_ID}/descendants

.. code:: json

    {
        "auth_token": "{AUTH_TOKEN}",
        "data": [
            {
                "id": "{CHILD_ACCOUNT}",
                "name": "{CHILD_NAME}",
                "realm": "{CHILD_REALM}",
                "tree": [
                    "{ACCOUNT_ID}"
                ]
            }
        ],
        "page_size": 1,
        "request_id": "{REQUEST_ID}",
        "revision": "{REVISION}",
        "start_key": "",
        "status": "success"
    }

Fetch immediate children of an account
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

    GET /v2/accounts/{ACCOUNT\_ID}/children

.. code:: shell

    curl -v -X GET \
        -H "X-Auth-Token: {AUTH_TOKEN}" \
        http://{SERVER}:8000/v2/accounts/{ACCOUNT_ID}/children

.. code:: json

    {
        "auth_token": "{AUTH_TOKEN}",
        "data": [
            {
                "id": "{CHILD_ACCOUNT}",
                "name": "{CHILD_NAME}",
                "realm": "{CHILD_REALM}",
                "tree": [
                    "{ACCOUNT_ID}"
                ]
            }
        ],
        "page_size": 1,
        "request_id": "{REQUEST_ID}",
        "revision": "{REVISION}",
        "start_key": "",
        "status": "success"
    }

Demote a reseller
^^^^^^^^^^^^^^^^^

Requires superduper admin auth token

    DELETE /v2/accounts/{ACCOUNT\_ID}/reseller

.. code:: shell

    curl -v -X DELETE \
        -H "X-Auth-Token: {AUTH_TOKEN}" \
        http://{SERVER}:8000/v2/accounts/{ACCOUNT_ID}/reseller

Promote a reseller
^^^^^^^^^^^^^^^^^^

Requires superduper admin auth token

    PUT /v2/accounts/{ACCOUNT\_ID}/reseller

.. code:: shell

    curl -v -X PUT \
        -H "X-Auth-Token: {AUTH_TOKEN}" \
        http://{SERVER}:8000/v2/accounts/{ACCOUNT_ID}/reseller

Move an account
^^^^^^^^^^^^^^^

An account can only be moved by a "superduper\_admin" or if enabled by anyone above the desired account.

You can enable that feature by editing the document ``crossbar.accounts`` in your ``system_config`` database and set the value to ``tree``.

+------------------+-------------------------------------+------------------------------+
| Key              | Value                               | Description                  |
+==================+=====================================+==============================+
| ``allow_move``   | enum("tree", "superduper\_admin")   | Who can move a sub-account   |
+------------------+-------------------------------------+------------------------------+

    POST /v2/accounts/{ACCOUNT\_ID}/move

.. code:: shell

    curl -v -X POST \
        -H "X-Auth-Token: {AUTH_TOKEN}" \
        -d '{"data": {"to": "{ACCOUNT_ID_DESTINATION}"}}' \
        http://{SERVER}:8000/v2/accounts/{ACCOUNT_ID}/move

.. code:: json

    {
        "auth_token": "{AUTH_TOKEN}",
        "data": {
            "billing_mode": "manual",
            "call_restriction": {},
            "caller_id": {},
            "created": 63621662701,
            "dial_plan": {},
            "enabled": true,
            "id": "{ACCOUNT_ID}",
            "is_reseller": false,
            "language": "en-us",
            "music_on_hold": {},
            "name": "child account",
            "preflow": {},
            "realm": "aeac33.sip.2600hz.com",
            "reseller_id": "undefined",
            "ringtones": {},
            "superduper_admin": false,
            "timezone": "America/Los_Angeles",
            "wnm_allow_additions": false
        },
        "request_id": "{REQUEST_ID}",
        "revision": "{REVISION}",
        "status": "success"
    }
