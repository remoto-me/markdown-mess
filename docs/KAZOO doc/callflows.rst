Callflows
~~~~~~~~~

About Callflows
^^^^^^^^^^^^^^^

Callflows are the instructions Kazoo uses to process a call. A callflow
includes a list of numbers or regex patterns used by Kazoo to determine
what callflow is used when a call comes in for an account. The ``flow``
parameter defines the tree of actions, allowing branching (such as in
the ``menu`` action) and chaining actions together. You can also branch
to other callflows and execute its ``flow`` (useful to avoid recreating
the same sub-flow structure).

Schema
^^^^^^

+------+--------------+-------+----------+-----------+
| Key  | Description  | Type  | Default  | Required  |
+======+==============+=======+==========+===========+
| ``fe | When the     | ``obj |          | ``false`` |
| atur | callflow is  | ect`` |          |           |
| ecod | used as a    |       |          |           |
| e``  | featurecode  |       |          |           |
|      | this object  |       |          |           |
|      | tracks the   |       |          |           |
|      | intended     |       |          |           |
|      | match of the |       |          |           |
|      | pattern and  |       |          |           |
|      | name of the  |       |          |           |
|      | feature      |       |          |           |
+------+--------------+-------+----------+-----------+
| ``fe |              | ``str |          | ``false`` |
| atur |              | ing(1 |          |           |
| ecod |              | ..128 |          |           |
| e.na |              | )``   |          |           |
| me`` |              |       |          |           |
+------+--------------+-------+----------+-----------+
| ``fe |              | ``str |          | ``false`` |
| atur |              | ing(1 |          |           |
| ecod |              | ..30) |          |           |
| e.nu |              | ``    |          |           |
| mber |              |       |          |           |
| ``   |              |       |          |           |
+------+--------------+-------+----------+-----------+
| ``fl | A callflow   | ``obj |          | ``true``  |
| ow`` | node defines | ect`` |          |           |
|      | a module to  |       |          |           |
|      | execute,     |       |          |           |
|      | data to      |       |          |           |
|      | provide to   |       |          |           |
|      | that module, |       |          |           |
|      | and zero or  |       |          |           |
|      | more         |       |          |           |
|      | children to  |       |          |           |
|      | branch to    |       |          |           |
+------+--------------+-------+----------+-----------+
| ``fl | Children     | ``obj | ``{}``   | ``false`` |
| ow.c | callflows    | ect`` |          |           |
| hild |              |       |          |           |
| ren` |              |       |          |           |
| `    |              |       |          |           |
+------+--------------+-------+----------+-----------+
| ``fl | The          | ``obj | ``{}``   | ``true``  |
| ow.d | data/argumen | ect`` |          |           |
| ata` | ts           |       |          |           |
| `    | of the       |       |          |           |
|      | callflow     |       |          |           |
|      | module       |       |          |           |
+------+--------------+-------+----------+-----------+
| ``fl | The name of  | ``str |          | ``true``  |
| ow.m | the callflow | ing(1 |          |           |
| odul | module to    | ..64) |          |           |
| e``  | excute at    | ``    |          |           |
|      | this node    |       |          |           |
+------+--------------+-------+----------+-----------+
| ``me | Actions      | ``#/d |          | ``false`` |
| tafl | applied to a | efini |          |           |
| ow`` | call outside | tions |          |           |
|      | of the       | /meta |          |           |
|      | normal       | flows |          |           |
|      | callflow,    | ``    |          |           |
|      | initiated by |       |          |           |
|      | the          |       |          |           |
|      | caller(s)    |       |          |           |
+------+--------------+-------+----------+-----------+
| ``nu | A list of    | ``arr | ``[]``   | ``false`` |
| mber | static       | ay(st |          |           |
| s``  | numbers that | ring( |          |           |
|      | the callflow | 1..36 |          |           |
|      | should       | ))``  |          |           |
|      | execute for  |       |          |           |
+------+--------------+-------+----------+-----------+
| ``nu |              | ``str |          | ``false`` |
| mber |              | ing`` |          |           |
| s.[] |              |       |          |           |
| ``   |              |       |          |           |
+------+--------------+-------+----------+-----------+
| ``pa | A list of    | ``arr | ``[]``   | ``false`` |
| tter | regular      | ay(st |          |           |
| ns`` | expressions  | ring( |          |           |
|      | that the     | 1..)) |          |           |
|      | callflow     | ``    |          |           |
|      | should       |       |          |           |
|      | execute for, |       |          |           |
|      | with         |       |          |           |
|      | optional     |       |          |           |
|      | capture      |       |          |           |
|      | groups       |       |          |           |
+------+--------------+-------+----------+-----------+
| ``pa |              | ``str |          | ``false`` |
| tter |              | ing`` |          |           |
| ns.[ |              |       |          |           |
| ]``  |              |       |          |           |
+------+--------------+-------+----------+-----------+

Fetch an account's callflows
^^^^^^^^^^^^^^^^^^^^^^^^^^^^

    GET /v2/accounts/{ACCOUNT\_ID}/callflows

.. code:: shell

    curl -v -X GET \
        -H "X-Auth-Token: {AUTH_TOKEN}" \
        http://{SERVER}:8000/v2/accounts/{ACCOUNT_ID}/callflows

Create a new callflow
^^^^^^^^^^^^^^^^^^^^^

    PUT /v2/accounts/{ACCOUNT\_ID}/callflows

.. code:: shell

    curl -v -X PUT \
        -H "X-Auth-Token: {AUTH_TOKEN}" \
        http://{SERVER}:8000/v2/accounts/{ACCOUNT_ID}/callflows

Remove a callflow
^^^^^^^^^^^^^^^^^

    DELETE /v2/accounts/{ACCOUNT\_ID}/callflows/{CALLFLOW\_ID}

.. code:: shell

    curl -v -X DELETE \
        -H "X-Auth-Token: {AUTH_TOKEN}" \
        http://{SERVER}:8000/v2/accounts/{ACCOUNT_ID}/callflows/{CALLFLOW_ID}

Fetch a callflow's details
^^^^^^^^^^^^^^^^^^^^^^^^^^

    GET /v2/accounts/{ACCOUNT\_ID}/callflows/{CALLFLOW\_ID}

.. code:: shell

    curl -v -X GET \
        -H "X-Auth-Token: {AUTH_TOKEN}" \
        http://{SERVER}:8000/v2/accounts/{ACCOUNT_ID}/callflows/{CALLFLOW_ID}

Patch a callflow object
^^^^^^^^^^^^^^^^^^^^^^^

    PATCH /v2/accounts/{ACCOUNT\_ID}/callflows/{CALLFLOW\_ID}

.. code:: shell

    curl -v -X PATCH \
        -H "X-Auth-Token: {AUTH_TOKEN}" \
        http://{SERVER}:8000/v2/accounts/{ACCOUNT_ID}/callflows/{CALLFLOW_ID}

Change a callflow object
^^^^^^^^^^^^^^^^^^^^^^^^

    POST /v2/accounts/{ACCOUNT\_ID}/callflows/{CALLFLOW\_ID}

.. code:: shell

    curl -v -X POST \
        -H "X-Auth-Token: {AUTH_TOKEN}" \
        http://{SERVER}:8000/v2/accounts/{ACCOUNT_ID}/callflows/{CALLFLOW_ID}
