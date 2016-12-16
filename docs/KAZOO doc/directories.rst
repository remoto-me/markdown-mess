Directories
~~~~~~~~~~~

About Directories
^^^^^^^^^^^^^^^^^

Directories provide the ability to route a caller to a user by having
the caller enter DTMF corresponding to the directory users' first orlast
names (versus having to know the user's extension).

Schema
^^^^^^

+------+--------------+-------+----------+-----------+
| Key  | Description  | Type  | Default  | Required  |
+======+==============+=======+==========+===========+
| ``co | When one     | ``boo | ``true`` | ``false`` |
| nfir | match is     | lean` |          |           |
| m_ma | found,       | `     |          |           |
| tch` | require      |       |          |           |
| `    | caller to    |       |          |           |
|      | confirm the  |       |          |           |
|      | match before |       |          |           |
|      | connecting   |       |          |           |
+------+--------------+-------+----------+-----------+
| ``ma | Cap the      | ``int | ``0``    | ``false`` |
| x_dt | number of    | eger` |          |           |
| mf`` | DTMF         | `     |          |           |
|      | characters   |       |          |           |
|      | collected    |       |          |           |
|      | from a       |       |          |           |
|      | caller, 0    |       |          |           |
|      | for          |       |          |           |
|      | unlimited    |       |          |           |
+------+--------------+-------+----------+-----------+
| ``mi | How many     | ``int | ``3``    | ``false`` |
| n_dt | DTMF         | eger` |          |           |
| mf`` | characters   | `     |          |           |
|      | to collect   |       |          |           |
|      | from a       |       |          |           |
|      | caller       |       |          |           |
|      | before       |       |          |           |
|      | processing   |       |          |           |
|      | the          |       |          |           |
|      | directory    |       |          |           |
+------+--------------+-------+----------+-----------+
| ``na | The name of  | ``str |          | ``true``  |
| me`` | the          | ing(1 |          |           |
|      | directory    | ..)`` |          |           |
+------+--------------+-------+----------+-----------+
| ``so | What field   | ``str | ``last_n | ``false`` |
| rt_b | to sort on   | ing(' | ame``    |           |
| y``  | in matching  | first |          |           |
|      | documents    | _name |          |           |
|      | when a       | ', 'l |          |           |
|      | caller       | ast_n |          |           |
|      | enters       | ame') |          |           |
|      | characters   | ``    |          |           |
+------+--------------+-------+----------+-----------+
| ``us | The list of  | ``arr | ``[]``   | ``false`` |
| ers` | users        | ay(st |          |           |
| `    | associated   | ring) |          |           |
|      | with this    | ``    |          |           |
|      | directory    |       |          |           |
+------+--------------+-------+----------+-----------+
| ``us |              | ``str |          | ``false`` |
| ers. |              | ing`` |          |           |
| []`` |              |       |          |           |
+------+--------------+-------+----------+-----------+

Fetch
^^^^^

    GET /v2/accounts/{ACCOUNT\_ID}/directories

.. code:: shell

    curl -v -X GET \
        -H "X-Auth-Token: {AUTH_TOKEN}" \
        http://{SERVER}:8000/v2/accounts/{ACCOUNT_ID}/directories

Create
^^^^^^

    PUT /v2/accounts/{ACCOUNT\_ID}/directories

.. code:: shell

    curl -v -X PUT \
        -H "X-Auth-Token: {AUTH_TOKEN}" \
        http://{SERVER}:8000/v2/accounts/{ACCOUNT_ID}/directories

Remove
^^^^^^

    DELETE /v2/accounts/{ACCOUNT\_ID}/directories/{DIRECTORY\_ID}

.. code:: shell

    curl -v -X DELETE \
        -H "X-Auth-Token: {AUTH_TOKEN}" \
        http://{SERVER}:8000/v2/accounts/{ACCOUNT_ID}/directories/{DIRECTORY_ID}

Fetch a directory listing
^^^^^^^^^^^^^^^^^^^^^^^^^

    GET /v2/accounts/{ACCOUNT\_ID}/directories/{DIRECTORY\_ID}

.. code:: shell

    curl -v -X GET \
        -H "X-Auth-Token: {AUTH_TOKEN}" \
        http://{SERVER}:8000/v2/accounts/{ACCOUNT_ID}/directories/{DIRECTORY_ID}

Fetch a directory as a PDF
^^^^^^^^^^^^^^^^^^^^^^^^^^

It is possible to fetch the directory as a PDF for download (such as a
company direcotry, a sales department directory, etc)

    GET /v2/accounts/{ACCOUNT\_ID}/directories/{DIRECTORY\_ID}

.. code:: shell

    curl -v -X GET \
        -H "X-Auth-Token: {AUTH_TOKEN}" \
        -H "Accept: application/pdf"
        http://{SERVER}:8000/v2/accounts/{ACCOUNT_ID}/directories/{DIRECTORY_ID}

If your client doesn't support setting the ``Accept`` header, you can
append ``?accept=pdf`` to the URI and Kazoo will pretend you sent the
proper ``Accept`` header.

Patch
^^^^^

    PATCH /v2/accounts/{ACCOUNT\_ID}/directories/{DIRECTORY\_ID}

.. code:: shell

    curl -v -X PATCH \
        -H "X-Auth-Token: {AUTH_TOKEN}" \
        http://{SERVER}:8000/v2/accounts/{ACCOUNT_ID}/directories/{DIRECTORY_ID}

Change
^^^^^^

    POST /v2/accounts/{ACCOUNT\_ID}/directories/{DIRECTORY\_ID}

.. code:: shell

    curl -v -X POST \
        -H "X-Auth-Token: {AUTH_TOKEN}" \
        http://{SERVER}:8000/v2/accounts/{ACCOUNT_ID}/directories/{DIRECTORY_ID}
