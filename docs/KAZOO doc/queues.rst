Queues
~~~~~~

About Queues
^^^^^^^^^^^^

When you have more callers than agents to handle those calls, you can create a call queue to put the callers on hold while agents process callers in the order they arrived in.

Schema
^^^^^^

+------+--------------+-------+----------+-----------+
| Key  | Description  | Type  | Default  | Required  |
+======+==============+=======+==========+===========+
| ``ag | In seconds,  | ``int | ``15``   | ``false`` |
| ent_ | how long to  | eger` |          |           |
| ring | ring an      | `     |          |           |
| _tim | agent before |       |          |           |
| eout | progressing  |       |          |           |
| ``   | to the next  |       |          |           |
|      | agent        |       |          |           |
|      | available    |       |          |           |
+------+--------------+-------+----------+-----------+
| ``ag | Pre-defined  | ``int | ``0``    | ``false`` |
| ent_ | wait period  | eger` |          |           |
| wrap | applied      | `     |          |           |
| up_t | after an     |       |          |           |
| ime` | agent        |       |          |           |
| `    | handles a    |       |          |           |
|      | customer     |       |          |           |
|      | call         |       |          |           |
+------+--------------+-------+----------+-----------+
| ``an | Media ID (or | ``str |          | ``false`` |
| noun | appropriate  | ing`` |          |           |
| ce`` | media URI)   |       |          |           |
|      | of media to  |       |          |           |
|      | play when    |       |          |           |
|      | caller is    |       |          |           |
|      | about to be  |       |          |           |
|      | connected.   |       |          |           |
+------+--------------+-------+----------+-----------+
| ``ca | Key caller   | ``str | ``#``    | ``false`` |
| ller | can press    | ing(' |          |           |
| _exi | while on     | 1', ' |          |           |
| t_ke | hold to exit | 2', ' |          |           |
| y``  | the queue    | 3', ' |          |           |
|      | and continue | 4', ' |          |           |
|      | in the       | 5', ' |          |           |
|      | callflow     | 6', ' |          |           |
|      |              | 7', ' |          |           |
|      |              | 8', ' |          |           |
|      |              | 9', ' |          |           |
|      |              | *', ' |          |           |
|      |              | 0', ' |          |           |
|      |              | #')`` |          |           |
+------+--------------+-------+----------+-----------+
| ``cd | An optional  | ``str |          | ``false`` |
| r_ur | HTTP URL to  | ing`` |          |           |
| l``  | POST the CDR |       |          |           |
+------+--------------+-------+----------+-----------+
| ``co | In seconds,  | ``int | ``3600`` | ``false`` |
| nnec | how long to  | eger` |          |           |
| tion | try to       | `     |          |           |
| _tim | connect the  |       |          |           |
| eout | caller       |       |          |           |
| ``   | before       |       |          |           |
|      | progressing  |       |          |           |
|      | past the     |       |          |           |
|      | queue        |       |          |           |
|      | callflow     |       |          |           |
|      | action       |       |          |           |
+------+--------------+-------+----------+-----------+
| ``en | Allows a     | ``boo | ``true`` | ``false`` |
| ter_ | caller to    | lean` |          |           |
| when | enter a      | `     |          |           |
| _emp | queue and    |       |          |           |
| ty`` | wait when no |       |          |           |
|      | agents are   |       |          |           |
|      | available    |       |          |           |
+------+--------------+-------+----------+-----------+
| ``ma | Maximum      | ``int |          | ``false`` |
| x_pr | possible     | eger` |          |           |
| iori | priority     | `     |          |           |
| ty`` | level queue  |       |          |           |
|      | will         |       |          |           |
|      | support. Can |       |          |           |
|      | not be       |       |          |           |
|      | redefined    |       |          |           |
|      | for existing |       |          |           |
|      | queue.       |       |          |           |
+------+--------------+-------+----------+-----------+
| ``ma | How many     | ``int | ``0``    | ``false`` |
| x_qu | callers are  | eger` |          |           |
| eue_ | allowed to   | `     |          |           |
| size | wait on hold |       |          |           |
| ``   | in the queue |       |          |           |
|      | (0 for no    |       |          |           |
|      | limit)       |       |          |           |
+------+--------------+-------+----------+-----------+
| ``mo | Media ID (or | ``str |          | ``false`` |
| h``  | appropriate  | ing`` |          |           |
|      | media URI)   |       |          |           |
|      | of media to  |       |          |           |
|      | play while   |       |          |           |
|      | caller is on |       |          |           |
|      | hold.        |       |          |           |
+------+--------------+-------+----------+-----------+
| ``na | A friendly   | ``str |          | ``true``  |
| me`` | name for the | ing(1 |          |           |
|      | queue        | ..128 |          |           |
|      |              | )``   |          |           |
+------+--------------+-------+----------+-----------+
| ``re | When         | ``boo | ``false` | ``false`` |
| cord | enabled, a   | lean` | `        |           |
| _cal | caller's     | `     |          |           |
| ler` | audio will   |       |          |           |
| `    | be recorded  |       |          |           |
+------+--------------+-------+----------+-----------+
| ``re | An optional  | ``str |          | ``false`` |
| cord | HTTP URL to  | ing`` |          |           |
| ing_ | PUT the call |       |          |           |
| url` | recording    |       |          |           |
| `    | after the    |       |          |           |
|      | call ends    |       |          |           |
|      | (and should  |       |          |           |
|      | respond to   |       |          |           |
|      | GET for      |       |          |           |
|      | retrieving   |       |          |           |
|      | the audio    |       |          |           |
|      | data)        |       |          |           |
+------+--------------+-------+----------+-----------+
| ``ri | The number   | ``int | ``1``    | ``false`` |
| ng_s | of agents to | eger` |          |           |
| imul | try in       | `     |          |           |
| tane | parallel     |       |          |           |
| ousl | when         |       |          |           |
| y``  | connecting a |       |          |           |
|      | caller       |       |          |           |
+------+--------------+-------+----------+-----------+
| ``st | The queue    | ``str | ``round_ | ``false`` |
| rate | strategy for | ing(' | robin``  |           |
| gy`` | connecting   | round |          |           |
|      | agents to    | _robi |          |           |
|      | callers      | n', ' |          |           |
|      |              | most_ |          |           |
|      |              | idle' |          |           |
|      |              | )``   |          |           |
+------+--------------+-------+----------+-----------+

List queues
^^^^^^^^^^^

    GET /v2/accounts/{ACCOUNT\_ID}/queues

.. code:: shell

    curl -v -X GET \
        -H "X-Auth-Token: {AUTH_TOKEN}" \
        http://{SERVER}:8000/v2/accounts/{ACCOUNT_ID}/queues

.. code:: json

    {
        "auth_token": "{AUTH_TOKEN}",
        "data": [
            {
                "id": "37139638ff5b68f155d8445178524df1",
                "name": "Support Queue"
            }
        ],
        "page_size": 1,
        "request_id": "{REQUEST_ID}",
        "revision": "{REVISION}",
        "status": "success"
    }

Create a queue
^^^^^^^^^^^^^^

    PUT /v2/accounts/{ACCOUNT\_ID}/queues

.. code:: shell

    curl -v -X PUT \
        -H "X-Auth-Token: {AUTH_TOKEN}" \
        -d '{"data":{"name":"Support Queue"}}' \
        http://{SERVER}:8000/v2/accounts/{ACCOUNT_ID}/queues

.. code:: json

    {
        "auth_token": "{AUTH_TOKEN}",
        "data": {
            "agent_ring_timeout": 15,
            "agent_wrapup_time": 0,
            "caller_exit_key": "#",
            "connection_timeout": 3600,
            "enter_when_empty": true,
            "id": "37139638ff5b68f155d8445178524df1",
            "max_queue_size": 0,
            "name": "Support Queue",
            "record_caller": false,
            "ring_simultaneously": 1,
            "strategy": "round_robin"
        },
        "request_id": "{REQUEST_ID}",
        "revision": "{REVISION}",
        "status": "success"
    }

Remove a queue
^^^^^^^^^^^^^^

    DELETE /v2/accounts/{ACCOUNT\_ID}/queues/{QUEUE\_ID}

.. code:: shell

    curl -v -X DELETE \
        -H "X-Auth-Token: {AUTH_TOKEN}" \
        http://{SERVER}:8000/v2/accounts/{ACCOUNT_ID}/queues/{QUEUE_ID}

.. code:: json

    {
        "auth_token": "{AUTH_TOKEN}",
        "data": {
            "agent_ring_timeout": 15,
            "agent_wrapup_time": 0,
            "caller_exit_key": "#",
            "connection_timeout": 3600,
            "enter_when_empty": true,
            "id": "{QUEUE_ID}",
            "max_queue_size": 0,
            "name": "Support Queue",
            "record_caller": false,
            "ring_simultaneously": 1,
            "strategy": "round_robin"
        },
        "request_id": "{REQUEST_ID}",
        "revision": "{REVISION}",
        "status": "success"
    }

Details of a specific queue
^^^^^^^^^^^^^^^^^^^^^^^^^^^

    GET /v2/accounts/{ACCOUNT\_ID}/queues/{QUEUE\_ID}

.. code:: shell

    curl -v -X GET \
        -H "X-Auth-Token: {AUTH_TOKEN}" \
        http://{SERVER}:8000/v2/accounts/{ACCOUNT_ID}/queues/{QUEUE_ID}

.. code:: json

    {
        "auth_token": "{AUTH_TOKEN}",
        "data": {
            "agent_ring_timeout": 15,
            "agent_wrapup_time": 0,
            "agents": [],
            "caller_exit_key": "#",
            "connection_timeout": 3600,
            "enter_when_empty": true,
            "id": "{QUEUE_ID}",
            "max_queue_size": 0,
            "name": "Support Queue",
            "record_caller": false,
            "ring_simultaneously": 1,
            "strategy": "round_robin"
        },
        "request_id": "{REQUEST_ID}",
        "revision": "{REVISION}",
        "status": "success"
    }

Update a queue's properties
^^^^^^^^^^^^^^^^^^^^^^^^^^^

    POST /v2/accounts/{ACCOUNT\_ID}/queues/{QUEUE\_ID}

    PATCH /v2/accounts/{ACCOUNT\_ID}/queues/{QUEUE\_ID}

.. code:: shell

    curl -v -X POST \
        -H "X-Auth-Token: {AUTH_TOKEN}" \
        -d '{"data": {"name":"Support Queue", "max_queue_size": 7}}' \
        http://{SERVER}:8000/v2/accounts/{ACCOUNT_ID}/queues/{QUEUE_ID}

.. code:: json

    {
        "auth_token": "{AUTH_TOKEN}",
        "data": {
            "agent_ring_timeout": 15,
            "agent_wrapup_time": 0,
            "caller_exit_key": "#",
            "connection_timeout": 3600,
            "enter_when_empty": true,
            "id": "93d35ae9f91cf2d5ee4e1bfe59dda029",
            "max_queue_size": 7,
            "name": "Support Queue",
            "record_caller": false,
            "ring_simultaneously": 1,
            "strategy": "round_robin"
        },
        "request_id": "{REQUEST_ID}",
        "revision": "{REVISION}",
        "status": "success"
    }

List queues stats
^^^^^^^^^^^^^^^^^

    GET /v2/accounts/{ACCOUNT\_ID}/queues/stats

.. code:: shell

    curl -v -X GET \
        -H "X-Auth-Token: {AUTH_TOKEN}" \
        http://{SERVER}:8000/v2/accounts/{ACCOUNT_ID}/queues/stats

.. code:: json

    {
        "auth_token": "{AUTH_TOKEN}",
        "data": {
            "current_timestamp": 63642383800,
            "stats": []
        },
        "request_id": "{REQUEST_ID}",
        "revision": "{REVISION}",
        "status": "success"
    }

Clear a queue's roster
^^^^^^^^^^^^^^^^^^^^^^

    DELETE /v2/accounts/{ACCOUNT\_ID}/queues/{QUEUE\_ID}/roster

.. code:: shell

    curl -v -X DELETE \
        -H "X-Auth-Token: {AUTH_TOKEN}" \
        http://{SERVER}:8000/v2/accounts/{ACCOUNT_ID}/queues/{QUEUE_ID}/roster

.. code:: json

    {
        "auth_token": "{AUTH_TOKEN}",
        "request_id": "{REQUEST_ID}",
        "revision": "{REVISION}",
        "status": "success"
    }

List queue roster (which agents are assigned to the queue)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

    GET /v2/accounts/{ACCOUNT\_ID}/queues/{QUEUE\_ID}/roster

.. code:: shell

    curl -v -X GET \
        -H "X-Auth-Token: {AUTH_TOKEN}" \
        http://{SERVER}:8000/v2/accounts/{ACCOUNT_ID}/queues/{QUEUE_ID}/roster

.. code:: json

    {
        "auth_token": "{AUTH_TOKEN}",
        "data": [],
        "page_size": 0,
        "request_id": "{REQUEST_ID}",
        "revision": "{REVISION}",
        "status": "success"
    }

Set the queue roster
''''''''''''''''''''

::

    curl -v -X POST -H "X-Auth-Token: {AUTH_TOKEN}" -H "Content-Type: application/json" http://server.com:8000/v1/accounts/{ACCOUNT_ID}/queues/{QUEUE_ID}/roster -d '{"data": ["f3ced8ea7bccc352a2124e8a34351e81", "e154a97ec2942599865a1591a477fd19"]}'
